#encoding:utf-8

require_relative 'PowerEfficientSpaceStation'
require_relative 'Loot'
require_relative 'Transformation'
require_relative 'BetaPowerEfficientSpaceStationToUI'
require_relative 'SpaceStation'
require_relative 'Dice'

module Deepspace
    class BetaPowerEfficientSpaceStation < PowerEfficientSpaceStation

        @@EXTRAEFFICIENCY = 1.2

        public

        def initialize(estacion)
            super(estacion)
            @dice = Dice.new
        end

        def fire
            factor=1.0
            if ( @dice.extraEfficiency )
                factor = @@EXTRAEFFICIENCY
            end
            return (super*factor)
        end

        def loot=(l) # Revisar tema transformaciones
            super(l)
            return Transformation::NOTRANSFORM
        end

        def getUIversion
            return BetaPowerEfficientSpaceStationToUI.new(self)
        end

        def to_s
            return getUIversion.name
        end

    end

end

