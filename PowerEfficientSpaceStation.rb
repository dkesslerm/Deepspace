#encoding:utf-8

require_relative 'SpaceStation'
require_relative 'Loot'
require_relative 'Transformation'
require_relative 'PowerEfficientSpaceStationToUI'

module Deepspace
    class PowerEfficientSpaceStation < SpaceStation

        @@EFFICIENCYFACTOR = 1.10

        public

        def initialize(estacion)
            super(estacion)
        end

        def loot=(l) #Revisar tema transformaciones
            super(l)
            return Transformation::NOTRANSFORM
        end

        def fire
            return (super*@@EFFICIENCYFACTOR)
        end

        def protection
            return (super*@@EFFICIENCYFACTOR)
        end

        def getUIversion
            return PowerEfficientSpaceStationToUI.new(self)
        end

        def to_s  #Revisar name
            return getUIversion.name
        end

    end

end




