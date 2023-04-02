#encoding: utf-8

require_relative 'HangarToUI.rb'
require_relative 'Weapon.rb'
require_relative 'ShieldBooster.rb'

module DeepSpace

    class Hangar

        def initialize(capacity)
            @maxElements=capacity
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

        end

        public

        def addWeapon(w)

        end

        def addShieldBooster(s)

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

        end

        def removeWeapon(w)

        end

        def to_s
            getUIVersion.to_s
        end
        
    end
end