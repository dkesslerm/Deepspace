#encoding:utf-8

require_relative 'DamageToUI'
require_relative 'WeaponType'
require_relative 'ShieldBooster'

module Deepspace
    class Damage
        
        def initialize(s)
            @nShields = s
        end
        
        def getUIversion
            DamageToUI.new(self)
        end

        public
        
        def adjustShield(s)
            sh=0
            s.each do |shield|
                sh += shield.uses
            end
            if (@nShields > sh)
                nShields_new=sh
            else
                nShields_new=@nShields
            end

            nShields_new
        end

        def discardShieldBooster
            if (@nShields>0)
                @nShields -= 1
            end
        end

        def nShields
            @nShields
        end

        def to_s
            getUIversion.to_s
        end

    end
end



