#encoding:utf-8
require_relative "SpaceStation"
require_relative "Dice"
require_relative "PowerEfficientSpaceStation"
require_relative "BetaPowerEfficientSpaceStationToUI"

module Deepspace
    class BetaPowerEfficientSpaceStation < PowerEfficientSpaceStation

        @@EXTRAEFFICIENCY = 1.2

        def initialize(s)
            super
            @dice = Dice.new
        end

        def fire
            if (@dice.extraEfficiency)
                super*@@EXTRAEFFICIENCY
            else
                super
            end
        end

        def getUIversion
            BetaPowerEfficientSpaceStationToUI.new(self)
        end
    end
end


        