#encoding:utf-8
require_relative "Damage"
require_relative "NumericDamageToUI"

module Deepspace
    class NumericDamage < Damage

        def initialize(w, s)
            super(s)
            @nWeapons = w
        end

        def getUIversion
            NumericDamageToUI.new(self)
        end

        public 

        def nWeapons
            @nWeapons
        end

        def discardWeapon(w)
            if (@nWeapons > 0)
                @nWeapons -= 1
            end
        end

        def hasNoEffect
            return (nShields == 0 && nWeapons == 0)
        end

        def adjust(w, s)
            nWeapons_new = @nWeapons
            if (nWeapons_new > w.length)
                nWeapons_new = w.length
            end

            NumericDamage.new(nWeapons_new, adjustShields(s))
        end

        def copy
            NumericDamage.new(nWeapons, nShields)
        end

        def to_s
            getUIversion.to_s
        end
    end
end
