#encoding: utf-8

module Deepspace

    class SuppliesPackage

        def initialize(a,f,s)
            @ammoPower=a
            @fuelUnits=f
            @shieldPower=s
        end

        #Constructor de copia
        def self.newCopy(s)
            self.new(s.ammoPower, s.fuelUnits, s.shieldPower)
        end

        public
        
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
            return "AmmoPower: #{@ammoPower}, FuelUnits: #{@fuelUnits}, ShieldPower: #{@shieldPower}"
        end
        
    end

end


