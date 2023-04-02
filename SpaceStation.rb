#encoding:utf-8

require_relative 'SpaceStationToUI.rb'
require_relative 'Hangar.rb'
require_relative 'SuppliesPackage.rb'
require_relative 'ShieldBooster.rb'
require_relative 'Weapon.rb'
require_relative 'Hangar.rb'
require_relative 'Damage.rb'
require_relative 'Loot.rb'
require_relative 'ShotResult.rb'

module DeepSpace
    class SpaceStation

        def intialize(n,supplies)
            @name=n
            
        end
        
        private

        @@MAXFUEL=100
        @@SHIELDLOSSPERUNITSHOT=0.1

        def assignFuelValue(f)
            @fuelUnits=f
        end

        def cleanPendingDamage

        end

        public
        
        attr_reader :ammoPower, :fuelUnits, :Hangars, :Name, :nMedals, :pendingDamage, :shieldBoosters, :weapons

        def cleanUpMountedItems

        end

        def discardHangar

        end

        def discardShieldBooster(i)

        end

        def discardWeaponInHangar(i)

        end

        def fire

        end

        def getUIversion
            SpaceStationToUI.new(self)
        end

        def mountShieldBooster(i)

        end

        def mountWeapon(i)

        end

        def move

        end

        def protection

        end

        def receiveHangar(h)

        end

        def receiveShieldBooster(s)

        end

        def receiveShot(shot)

        end

        def receiveSupplies(s)

        end

        def receiveWeapon(w)

        end

        def loot=(l)
            @loot=l
        end

        def pendingDamage=(d)
            @pendingDamage=d
        end

        def validState

        end

        def to_s
            getUIVersion.to_s
        end

    end
end


        
