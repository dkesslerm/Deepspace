#encoding: utf-8

module DeepSpace

    class SuppliesPackage

        def initialize(a,f,s)
            @ammoPower=a
            @fuelUnits=f
            @shieldPower=s
        end

        #Constructor de copia
        def newCopy(s)
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

    end

end


