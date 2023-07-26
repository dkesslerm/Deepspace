#encoding:utf-8
require_relative "HangarToUI"

module Deepspace
    
    class Hangar

        def initialize(capacity)
            @maxElements = capacity
            @weapons = []
            @shieldBoosters = []
        end

        def self.newCopy(h)
            copy = Hangar.new(h.maxElements)
            h.weapons.each do |w|
                copy.addWeapon(w)
            end

            h.shieldBoosters.each do |s|
                copy.addShieldBooster(s)
            end

            copy
        end

        def getUIversion
            HangarToUI.new(self)
        end

        private

        def spaceAvailable
            if (@weapons.length + @shieldBoosters.length < @maxElements)
                true
            else 
                false
            end
        end
    
        public
        
        def maxElements
            @maxElements
        end

        def weapons
            @weapons
        end

        def shieldBoosters
            @shieldBoosters
        end

        def addWeapon(w)
            ret = false
            if (spaceAvailable)
                @weapons.push(w)
                ret = true
            end

            ret
        end

        def addShieldBooster(s)
            ret = false
            if (spaceAvailable)
                @shieldBoosters.push(s)
                ret = true
            end
            
            ret
        end

        def removeWeapon(w)
            ret = nil
            if (w >= 0 && w < @weapons.length)
                ret = @weapons.delete_at(w)
            end
            
            ret
        end

        def removeShieldBooster(s)
            ret = nil
            if (s >= 0 && s < @shieldBoosters.length)
                ret = @shieldBoosters.delete_at(s)
            end

            ret
        end

        def to_s
            getUIversion.to_s
        end

    end
end

