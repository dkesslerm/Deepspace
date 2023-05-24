#encoding:utf-8

require_relative 'SpecificDamageToUI'
require_relative 'DamageToUI'
require_relative 'Damage'
require_relative 'WeaponType'
require_relative 'ShieldBooster'

module Deepspace
    class NumericDamage < Damage
        
        def initialize(wl,s)
            super(s)
            @weapons = wl
        end

        def getUIversion
            SpecificDamageToUI.new(self)
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

        def discardWeapon(w)
            @weapons.delete(w)
        end

        def hasNoEffect
            return (@nShields == 0 && @weapons.empty?)
        end

        def weapons
            @weapons
        end

        def adjust(w,s)
            nShields_new = adjustShield(s)

            weapons_new=[]
            aux=[]
            w.each do |we|
                aux.push(we)
            end
            @weapons.each do |wt|
                encontrado=false
                i=0
                while (i < aux.size && !encontrado)
                    if (wt == aux[i].type)
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
            return SpecificDamage.new(weapons_new,nShields_new)
        end

        def copy
            wl = []
            weapons.each do |w|
                wl.push(w)
            end

            SpecificDamage.new(wl, nShields)
        end

        def to_s
            SpecificDamageToUI.to_s
        end

    end
end