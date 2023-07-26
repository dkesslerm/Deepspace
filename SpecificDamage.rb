#encoding:utf-8
require_relative "Damage"
require_relative "SpecificDamageToUI"


module Deepspace
    class SpecificDamage < Damage
        
        @@DONOTEXIST = -1

        def initialize(wl, s)
            super(s)
            @weapons = []
            wl.each do |w|
                @weapons.push(w)
            end            
        end

        def getUIversion
            SpecificDamageToUI.new(self)
        end

        private

        def arrayContainsType(w, t)
            aux_wl = []
            w.each do |wt|
                aux_wl.push(wt.type)
            end

            ret = aux_wl.index(t)
            if (ret == nil)
                ret = @@DONOTEXIST
            end
            
            ret
        end

        public

        def weapons
            @weapons
        end

        def discardWeapon(w)
            indice = weapons.index(w.type)
            if indice != nil
              @weapons.delete_at(indice)
            end        
        end

        def hasNoEffect
            return (nShields == 0 && @weapons.empty?)
        end

        def adjust(w, s)
            weapons_new = []
            aux = []
            w.each do |we|
                aux.push(we)
            end

            weapons.each do |wt|
                if (arrayContainsType(aux, wt) != -1)
                    weapons_new.push(wt)
                    aux.delete_at(arrayContainsType(aux, wt))
                end
            end

            SpecificDamage.new(weapons_new, adjustShields(s))
        end        

        def copy
            aux = []
            @weapons.each do |w|
                aux.push(w)
            end

            SpecificDamage.new(aux, nShields)
        end

        def to_s
            getUIversion.to_s
        end
    end
end
