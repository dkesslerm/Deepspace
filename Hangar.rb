#encoding: utf-8

require_relative 'HangarToUI'
require_relative 'Weapon'
require_relative 'ShieldBooster'

module Deepspace

    class Hangar

        def initialize(capacity)
            @maxElements=capacity
            @weapons = nil
            @shieldBoosters = nil
        end

        def self.newCopy(h)
            @maxElements=h.maxElements
            @weapons=h.weapons
            @shieldBoosters=h.shieldBoosters
        end

        def getUIVersion
            HangarToUI.new(self)
        end

        private

        def spaceAvailable
            return (@weapons.length + @shieldBoosters.length < @maxElements)
        end

        public

        def addWeapon(w)
            if (spaceAvailable)
                @weapons.push(w)
                return true
            else
                return false
            end
        end

        def addShieldBooster(s)
            if (spaceAvailable)
                @shieldBoosters.push(s)
                return true
            else
                return false
            end
        end

        def maxElements
            @maxElements
        end

        def weapons
            @weapons
        end

        def shieldBoosters
            @shieldBoosters
        end

        def removeShieldBooster(s)
            if (s >= @shieldBoosters.length)
                return nil
            else
                @shieldBoosters.remove(s)
            end         
        end

        def removeWeapon(w)
            if (w >= @weapons.length)
                return nil
            else
                @weapons.remove(w)
            end            
        end

        def to_s
            getUIVersion.to_s
        end
        
    end
end