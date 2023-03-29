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
        
        @@WIN = 10

        def initialize()
            @currentStationIndex = 0
            @turns = 0
        end

        def combat(station,enemy)

        end

        def combat

        end

        def discardHangar

        end

        def discardShieldBooster(i)

        end

        def discardWeapon(i)

        end

        def discardWeaponinHangar(i)

        end

        def getState

        end

        def getUIVersion
            GameUniverseToUI.new(self)
        end

        def haveAWinner

        end

        def init(names)

        end

        def mountShieldBooster(i)

        end

        def mountWeapon(i)

        end

        def nextTurn

        end

    end
end


