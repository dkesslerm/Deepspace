#encoding:utf-8

module Deepspace

    class SuppliesPackage
        
        def initialize(a, f, s)
            @ammoPower = a
            @fuelUnits = f
            @shieldPower = s
        end

        def self.newCopy(s)
            self.new(s.ammoPower, s.fuelUnits, s.shieldPower)
        end

        def ammoPower
            @ammoPower
        end

        def fuelUnits
            @fuelUnits
        end

        def shieldPower
            @shieldPower
        end

        def to_s
            out = "Fuel units: #{fuelUnits.round(2)}, Power: #{ammoPower}, Shields: #{shieldPower}"
            out
        end
    end
end