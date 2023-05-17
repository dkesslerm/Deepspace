#encoding:utf-8

require_relative 'DamageToUI'
require_relative 'WeaponType'
require_relative 'ShieldBooster'

module Deepspace
    class Damage

        def initialize(w,wl, s)
            @weapons = wl
            @nWeapons = w
            @nShields = s
        end

        def self.newNumericWeapons(w,s)
            new(w, nil, s)
        end

        def self.newSpecificWeapons(wl, s)
            new(-1, wl, s)
        end

        def self.newCopy(d)
            new(d.nWeapons, d.weapons, d.nShields)
        end

        def getUIversion
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
            if (@nShields > sh)
                nShields_new=sh
            else
                nShields_new=@nShields
            end

            if (@nWeapons!=-1)
                if(@nWeapons > w.length)
                    nWeapons_new=w.length
                else
                    nWeapons_new=@nWeapons
                end
                return Damage.newNumericWeapons(nWeapons_new,nShields_new)
            else
                weapons_new=[]
                aux=[]
                w.each do |we|
                    aux.push(we)
                end
                @weapons.each do |wt|
                    encontrado=false
                    i=0
                    while ( i< aux.size && !encontrado)
                        if ( wt == aux[i].type)
                            encontrado=true
                        else
                            i+=1
                        end
                    end
                    if encontrado
                        weapons_new.push(wt)
                        aux.delete_at(i)
                    end
                end
                return Damage.newSpecificWeapons(weapons_new,nShields_new)
            end
        end

        def discardWeapon(w)
            if (@nWeapons!=-1)
                if(@nWeapons>0)
                    @nweapons -= 1
                end
            else
                @weapons.delete(w)
            end
        end

        def discardShieldBooster
            if (@nShields>0)
                @nShields -= 1
            end
        end

        def hasNoEffect
            if (@nWeapons != -1)
                return (@nShields == 0 && @nWeapons == 0)
            else
                return (@nShields == 0 && @weapons.empty?)
            end
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
            getUIversion.to_s
        end

    end
end



