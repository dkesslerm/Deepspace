#encoding:utf-8

require_relative 'DamageToUI.rb'
require_relative 'WeaponType.rb'

module DeepSpace
    class Damage

        def initialize(w,s)
            @nShields=s
            @nWeapons=w
        end

        def new???(wl, s)

        end

        def new???(d)

        end

        def getUIVersion
            DamageToUI.new(self)
        end

        def arrayContainsType(w,t)

        end

        def adjust(w,s)

        end

        def discardWeapon(w)

        end

        def discardShieldBooster
            
        end

        def hasNoEffect

        end

        def nShields
            @nShields
        end

        def nWeapons
            @nWeapons
        end

        def weapons
            @weapons
        end

        def to_s
            getUIVersion.to_s
        end

    end
end



