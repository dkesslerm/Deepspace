#encoding:utf-8

require_relative 'NumericDamageToUI'
require_relative 'DamageToUI'
require_relative 'Damage'
require_relative 'WeaponType'
require_relative 'ShieldBooster'

module Deepspace
    class NumericDamage < Damage
        
        def initialize(w,s)
            super(s)
            @nWeapons = w
        end

        def getUIversion
            NumericDamageToUI.new(self)
        end
            
        public 

        def discardWeapon(w)
            if(@nWeapons>0)
                @nweapons -= 1
            end
        end

        def hasNoEffect
            return (@nShields == 0 && @nWeapons == 0)
        end

        def nWeapons
            @nWeapons
        end

        def adjust(w,s)
            nShields_new = adjustShield(s)
            if(@nWeapons > w.length)
                nWeapons_new=w.length
            else
                nWeapons_new=@nWeapons
            end
            return NumericDamage.new(nWeapons_new,nShields_new)
        end

        def copy
            NumericDamage.new(nWeapons, nShields)
        end

        def to_s
            NumericDamageToUI.to_s
        end

    end
end
