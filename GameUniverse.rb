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

        end

        private
        
        @@WIN = 10

        public

        def initialize()
            @currentStationIndex = 0
            @turns = 0
            @gameState = GameStateController.new
            @dice = Dice.new
        end

        def combat

        end

        def discardHangar
            if(@gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT )
                @currentStation.discardHangar
            end
        end

        def discardShieldBooster(i)
            if(@gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT )
                @currentStation.discardShieldBooster(i)
            end
        end

        def discardWeapon(i)
            if(@gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT )
                @currentStation.discardWeapon(i)
            end
        end

        def discardWeaponinHangar(i)
            if(@gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT )
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

        end

        def mountShieldBooster(i)
            if(@gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT )
                @currentStation.mountShieldBooster(i)
            end
        end

        def mountWeapon(i)
            if(@gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT )
                @currentStation.mountWeapon(i)
            end
        end

        def nextTurn

        end

        def to_s
            getUIVersion.to_s
        end

    end
end


