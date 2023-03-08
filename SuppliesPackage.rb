#encoding: utf-8

module DeepSpace

    class SuppliesPackage

        def initialize(a,f,s)
            @ammoPower=a
            @fuelUnits=f
            @shieldPower=s
        end


        # Falta constructor de copia

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


