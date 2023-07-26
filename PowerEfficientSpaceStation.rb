#encoding:utf-8
require_relative "SpaceStation"
require_relative "PowerEfficientSpaceStationToUI"

module Deepspace
    class PowerEfficientSpaceStation < SpaceStation

        @@EFFICIENCYFACTOR = 1.1

        def initialize(s)
            copy(s)
        end

        def fire
            super*@@EFFICIENCYFACTOR
        end

        def protection
            super*@@EFFICIENCYFACTOR
        end

        def loot= (l)
            super(l)
            Transformation::NOTRANSFORM
        end
        
        def getUIversion
            PowerEfficientSpaceStationToUI.new(self)
        end
    end
end





