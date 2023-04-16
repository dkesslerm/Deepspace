#encoding:utf-8

require_relative 'GameUniverseToUI.rb'
require_relative 'Dice.rb'
require_relative 'GameStateController.rb'
require_relative 'CombatResult.rb'
require_relative 'SpaceStation.rb'
require_relative 'CardDealer.rb'
require_relative 'EnemyStarShip.rb'
require_relative 'GameCharacter.rb'

module DeepSpace
    class GameUniverse
        
        def combatGo(station,enemy)
            ch=@dice.firstShot
            if(ch==GameCharacter::ENEMYSTARSHIP)
                fire=enemy.fire
                result=station.receiveShot(fire)
                if(result==ShotResult::RESIST)
                    fire=station.fire
                    result=enemy.receiveShot(fire)
                    enemyWins=(result==ShotResult::RESIST)
                else
                    enemyWins=true
                end
            else
                fire=station.fire
                result=enemy.receiveShot(fire)
                enemyWins=(result==ShotResult::RESIST)
            end

            if(enemyWins)
                s=station.speed
                moves=@dice.spaceStationMoves(s)
                if(!moves)
                    damage=enemy.damage
                    station.setPendingDamage(damage)
                    combatResult=CombatResult::ENEMYWINS
                else
                    station.move
                    combatResult=CombatResult::STATIONESCAPES
                end

            else
                aLoot=enemy.loot
                station.loot=aLoot
                combatResult=CombatResult::STATIONWINS
            end
            @gameState.next(@turns,@spaceStations.size)
            return combatResult
        end

        private
        
        @@WIN = 10

        public

        def initialize()
            @currentStationIndex = -1
            @turns = 0
            @gameState = GameStateController.new
            @dice = Dice.new
            @currentStation = nil
            @currentEnemy = nil
            @spaceStations = nil
            @currentStationIndex = -1
        end

        def combat
            if (state==GameState::BEFORECOMBAT || state==GameState::INIT)
                return combatGo(@currentStation,@currentEnemy)
            else
                return CombatResult::NOCOMBAT
            end
        end

        def discardHangar
            if(state == GameState::INIT || state == GameState::AFTERCOMBAT )
                @currentStation.discardHangar
            end
        end

        def discardShieldBooster(i)
            if(state == GameState::INIT || state == GameState::AFTERCOMBAT )
                @currentStation.discardShieldBooster(i)
            end
        end

        def discardWeapon(i)
            if(state == GameState::INIT || state == GameState::AFTERCOMBAT )
                @currentStation.discardWeapon(i)
            end
        end

        def discardWeaponinHangar(i)
            if(state == GameState::INIT || state == GameState::AFTERCOMBAT )
                @currentStation.discardWeaponinHangar(i)
            end
        end

        def state
            @gameState.state
        end

        def getUIVersion
            GameUniverseToUI.new(self)
        end

        def haveAWinner
            return @currentStation.nMedals >= @@WIN
        end

        def init(names)
            if(state==GameState::CANNOTPLAY)
                @spaceStations=[]
                dealer=CardDealer.new
                names.each do |na|
                    station=SpaceStation.new(na,dealer.nextSuppliesPackage())
                    @spaceStations.add(station)
                    nh=dice.initWithNHangars
                    nw=dice.initWithNWeapons
                    ns=initWithNShields
                    lo=Loot.new(0,nw,ns,nh,0)
                    station.loot=lo
                end
                @currentStationIndex=dice.whoStarts(@spaceStations.size)
                @currentStation=@spaceStations.get(@currentStationIndex)
                @currentEnemy=dealer.nextEnemy
                @gameState.next(@turns,@spaceStations.size)
            end
        end

        def mountShieldBooster(i)
            if(state == GameState::INIT || state == GameState::AFTERCOMBAT )
                @currentStation.mountShieldBooster(i)
            end
        end

        def mountWeapon(i)
            if(state == GameState::INIT || state == GameState::AFTERCOMBAT )
                @currentStation.mountWeapon(i)
            end
        end

        def nextTurn
            if(state==GameState::AFTERCOMBAT && @currentStation.validState)
                @currentStationIndex=(@currentStationIndex+1) % @spaceStations.size
                @turns++
                @currentStation=@spaceStations.get(@currentStationIndex)
                @currentStation.cleanUpMountedItems
                dealer = CardDealer.new
                @currentEnemy = dealer.nextEnemy
                @gameState.next(@turns,spaceStations.size)
                return true
            else
                return false
            end
        end

        def to_s
            getUIVersion.to_s
        end

    end
end

