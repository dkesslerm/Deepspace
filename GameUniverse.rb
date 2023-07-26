#encoding:utf-8

require_relative 'GameUniverseToUI'
require_relative 'Dice'
require_relative 'GameStateController'
require_relative 'CombatResult'
require_relative 'SpaceStation'
require_relative 'CardDealer'
require_relative 'EnemyStarShip'
require_relative 'GameCharacter'
require_relative 'SpaceCity'
require_relative 'PowerEfficientSpaceStation'
require_relative 'BetaPowerEfficientSpaceStation'

module Deepspace
    
    class GameUniverse
        @@WIN = 10

        def initialize
            @gameState = GameStateController.new
            @turns = 0
            @dice = Dice.new
            @currentStation = nil
            @currentStationIndex = -1
            @currentEnemy = nil
            @spaceStations = []
            @haveSpaceCity = false
        end

        def getUIversion
            GameUniverseToUI.new(@currentStation, @currentEnemy)
        end

        def combatGo(station, enemy)
            ch = @dice.firstShot

            if (ch == GameCharacter::ENEMYSTARSHIP)
                fire = enemy.fire
                result = station.receiveShot(fire)

                if (result == ShotResult::RESIST)
                    fire = station.fire
                    result = enemy.receiveShot(fire)
                    enemyWins = (result == ShotResult::RESIST)
                else
                    enemyWins = true
                end
            else
                fire = station.fire
                result = enemy.receiveShot(fire)
                enemyWins = (result == ShotResult::RESIST)
            end

            if (enemyWins)
                s = station.speed
                moves = @dice.spaceStationMoves(s)

                if (!moves)
                    damage = enemy.damage
                    station.pendingDamage= damage
                    combatResult = CombatResult::ENEMYWINS
                else 
                    station.move
                    combatResult = CombatResult::STATIONESCAPES
                end
            else
                aLoot = enemy.loot
                station.loot= aLoot

                if (aLoot.efficient)
                    combatResult = CombatResult::STATIONWINSANDCONVERTS
                    makeStationEfficient
                elsif (aLoot.spaceCity)
                    combatResult = CombatResult::STATIONWINSANDCONVERTS
                    createSpaceCity
                else
                    combatResult = CombatResult::STATIONWINS
                end
            end

            @gameState.next(@turns, @spaceStations.length)

            return combatResult
        end

        private    

        def createSpaceCity
            if (@haveSpaceCity == false)
                aux = []
                @spaceStations.each do |ss|
                    aux.push(ss)
                end
                aux.delete(@currentStation)

                @currentStation = SpaceCity.new(@currentStation, aux)
                
                @haveSpaceCity = true

                @spaceStations[@currentStationIndex] = @currentStation
            end
        end

        def makeStationEfficient
            if (@dice.extraEfficiency)
                @currentStation = BetaPowerEfficientSpaceStation.new(@currentStation)
            else
                @currentStation = PowerEfficientSpaceStation.new(@currentStation)
            end
            
            @spaceStations[@currentStationIndex] = @currentStation
        end
        
        public
        
        def currentStation
            @currentStation
        end

        def state
            @gameState.state
        end

        def haveAWinner
            win = false
            if (@currentStation.nMedals == @@WIN)
                win = true
            end

            win
        end

        def discardHangar
            if (state == GameState::INIT || state == GameState::AFTERCOMBAT)
                @currentStation.discardHangar
            end
        end

        def discardShieldBooster(i)
            if(state == GameState::INIT || state == GameState::AFTERCOMBAT)
                @currentStation.discardShieldBooster(i)
            end
        end

        def discardShieldBoosterInHangar(i)
            if (state == GameState::INIT || state == GameState::AFTERCOMBAT)
                @currentStation.discardShieldBoosterInHangar(i)
            end
        end

        def discardWeapon(i)
            if (state == GameState::INIT || state == GameState::AFTERCOMBAT)
                @currentStation.discardWeapon(i)
            end
        end

        def discardWeaponInHangar(i)
            if (state == GameState::INIT || state == GameState::AFTERCOMBAT)
                @currentStation.discardWeaponInHangar(i)
            end
        end

        def mountShieldBooster(i)
            if (state == GameState::INIT || state == GameState::AFTERCOMBAT)
                @currentStation.mountShieldBooster(i)
            end
        end
        
        def mountWeapon(i)
            if (state == GameState::INIT || state == GameState::AFTERCOMBAT)
                @currentStation.mountWeapon(i)
            end
        end

        def init(names)
            if (state == GameState::CANNOTPLAY)
                dealer = CardDealer.instance
                
                i = 0
                while (i < names.length)
                    supplies = dealer.nextSuppliesPackage
                    station = SpaceStation.new(names.at(i), supplies)
                    @spaceStations.push(station)

                    nh = @dice.initWithNHangars
                    nw = @dice.initWithNWeapons
                    ns = @dice.initWithNShields

                    lo = Loot.new(0, nw, ns, nh, 0)
                    station.loot=lo
                    i += 1
                end

                @currentStationIndex = @dice.whoStarts(names.length)
                @currentStation = @spaceStations.at(@currentStationIndex)
                @currentEnemy = dealer.nextEnemy
                @gameState.next(@turns, @spaceStations.length)
            end
        end

        def nextTurn
            ret = false

            if (state == GameState::AFTERCOMBAT)
                stationState = @currentStation.validState
                if (stationState)
                    @currentStationIndex = (@currentStationIndex+1) % @spaceStations.length
                    @turns += 1
                    @currentStation = @spaceStations.at(@currentStationIndex)
                    @currentStation.cleanUpMountedItems
                    dealer = CardDealer.instance
                    @currentEnemy = dealer.nextEnemy
                    @gameState.next(@turns, @spaceStations.length)

                    ret = true
                end
            end

            ret
        end

        def combat
            if (state == GameState::BEFORECOMBAT || state == GameState::INIT)
                combatResult = combatGo(@currentStation, @currentEnemy)
            else
                combatResult = CombatResult::NOCOMBAT
            end

            combatResult
        end

        def to_s
            getUIversion.to_s
        end
    end
end