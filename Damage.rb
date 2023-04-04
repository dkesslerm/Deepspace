#encoding:utf-8

require_relative 'DamageToUI.rb'
require_relative 'WeaponType.rb'
require_relative 'ShieldBooster.rb'

module DeepSpace
    class Damage

        def self.newNumericWeapons(w,s)
            @nShields=s
            @nWeapons=w
            @weapons=[]
        end

        def self.newSpecificWeapons(wl, s)
            @nShields=s
            @weapons=wl
            @nWeapons=-1
        end

        def self.newCopy(d)
            @nShields=d.nShields
            @weapons=d.weapons
            @nWeapons=d.nWeapons
        end

        def getUIVersion
            DamageToUI.new(self)
        end

        private

        def arrayContainsType(w,t)
            i=w.index(t)
            if(i)
                return i
            else
                return -1
            end 
        end

        public
        
        def adjust(w,s)
            sh=0
            s.each do |shield|
                sh += shield.uses
            end
            if (nShields > sh)
                nShields_new=sh
            else
                nShields_new=nShields
            end

            if (nWeapons!=-1)
                if(nWeapons > w.length)
                    nWeapons_new=w.length
                else
                    nWeapons_new=nWeapons
                end
                return newNumericWeapons(nWeapons_new,nShields_new)
            else
                weapons_new=[]
                weapons.each do |we|
                    if (w.include?(we))
                        weapons_new.push(we)
                    end
                end
                return newSpecificWeapons(weapons_new,nShields_new)
            end
        end

        def discardWeapon(w)
            if (nWeapons!=-1)
                if(nWeapons>0)
                    @nweapons -= 1
                end
            else
                weapons.delete(w)
            end
        end

        def discardShieldBooster
            if (nShields>0)
                @nShields -= 1
            end
        end

        def hasNoEffect
            if (nWeapons != -1)
                return (nShields == 0 && nWeapons == 0)
            else
                return (nShields == 0 && weapons.emty?)
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



