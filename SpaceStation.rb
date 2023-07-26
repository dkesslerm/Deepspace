#encoding:utf-8
require_relative 'SpaceStationToUI'
require_relative 'Hangar'
require_relative 'SuppliesPackage'
require_relative 'ShieldBooster'
require_relative 'Weapon'
require_relative 'Damage'
require_relative 'Loot'
require_relative 'ShotResult'
require_relative 'CardDealer'
require_relative 'Transformation'

module Deepspace

    class SpaceStation
        @@MAXFUEL = 100
        @@SHIELDLOSSPERUNITSHOT = 0.1
        
        def initialize(n, supplies)
            @ammoPower = supplies.ammoPower
            @fuelUnits = supplies.fuelUnits
            @shieldPower = supplies.shieldPower
            @name = n

            @nMedals = 0
            @pendingDamage = nil
            @hangar = nil
            @weapons = []
            @shieldBoosters = []
        end
=begin
        def self.newCopy(s)

            copy = SpaceStation.new(s.name, SuppliesPackage.new(s.ammoPower, s.fuelUnits, s.shieldPower))

            copy.nMedals = s.nMedals
            copy.pendingDamage= s.pendingDamage
            copy.receiveHangar(s.hangar)
            copy.weapons= s.weapons
            copy.shieldBoosters= s.shieldBoosters
            
            copy
        end
=end
        def getUIversion
            SpaceStationToUI.new(self)
        end

        attr_writer :nMedals

        private

        def assignFuelValue(f)
            if (f > @@MAXFUEL)
                f = @@MAXFUEL
            elsif (f < 0)
                f = 0
            end
            @fuelUnits = f
        end

        def cleanPendingDamage
            if (@pendingDamage.hasNoEffect)
                @pendingDamage = nil
            end
        end

        public

        def copy(ss)
            @ammoPower = ss.ammoPower
            @fuelUnits = ss.fuelUnits
            @shieldPower = ss.shieldPower
            @name = ss.name
            @nMedals = ss.nMedals
            @pendingDamage = ss.pendingDamage
            @hangar = ss.hangar
            @weapons = ss.weapons
            @shieldBoosters = ss.shieldBoosters
        end
        
        def weapons= (wl)
            wl.each do |w|
                @weapons.push(w)
            end
        end

        def shieldBoosters= (sb)
            sb.each do |s|
                @shieldBoosters.push(s)
            end
        end

        def ammoPower
            @ammoPower
        end

        def fuelUnits
            @fuelUnits
        end

        def hangar
            @hangar
        end

        def name
            @name
        end

        def nMedals
            @nMedals
        end

        def pendingDamage
            @pendingDamage
        end

        def shieldBoosters
            @shieldBoosters
        end

        def weapons
            @weapons
        end

        def shieldPower
            @shieldPower
        end

        def pendingDamage= d
            @pendingDamage = d
        end

        def receiveWeapon(w)
            ret = false
            if (@hangar != nil)
                ret = @hangar.addWeapon(w)                
            end
            
            ret
        end

        def receiveShieldBooster(s)
            ret = false
            if (@hangar != nil)
                ret = @hangar.addShieldBooster(s)
            end

            ret
        end

        def receiveHangar(h)
            if (@hangar == nil)
                @hangar = h
            end
        end

        def discardHangar
            @hangar = nil
        end

        def receiveSupplies(s)
            @ammoPower += s.ammoPower
            @shieldPower += s.shieldPower
            assignFuelValue(s.fuelUnits + @fuelUnits)
        end

        def pendingDamage=(d)
            if (d != nil)
                @pendingDamage = d.adjust(weapons, shieldBoosters)
            else 
                @pendingDamage = nil
            end
        end

        def mountWeapon(i)
            if (@hangar != nil && i >= 0 && i < hangar.weapons.length)
                w = @hangar.removeWeapon(i)
            end

            if (w != nil)
                @weapons.push(w)
            end
        end

        def mountShieldBooster(i)
            if (@hangar != nil && i >= 0 && i < hangar.shieldBoosters.length)
                sb = @hangar.removeShieldBooster(i)
            end

            if (sb != nil)
                @shieldBoosters.push(sb)
            end
        end

        def discardWeaponInHangar(i)
            if (@hangar != nil)
                @hangar.removeWeapon(i)
            end
        end

        def discardShieldBoosterInHangar(i)
            if (@hangar != nil)
                @hangar.removeShieldBooster(i)
            end
        end

        def speed
            return (@fuelUnits / @@MAXFUEL)
        end

        def move
            assignFuelValue(@fuelUnits - @fuelUnits*speed)
        end

        def validState
            pendingDamage == nil || pendingDamage.hasNoEffect
        end

        def cleanUpMountedItems
            @weapons.each do |w|
                if (w.uses == 0)
                    @weapons.delete(w)
                end
            end

            @shieldBoosters.each do |s|
                if (s.uses == 0)
                    @shieldBoosters.delete(s)
                end
            end
        end

        def fire
            size = @weapons.length
            factor = 1
            
            @weapons.each do |w|
                factor *= w.useIt
            end

            return (ammoPower*factor)
        end
        
        def protection
            size = @shieldBoosters.length
            factor = 1

            @shieldBoosters.each do |s|
                factor *= s.useIt
            end

            return (shieldPower*factor)
        end

        def receiveShot(shot) 
            myProtection = protection
            
            if (myProtection >= shot)
                @shieldPower -= @@SHIELDLOSSPERUNITSHOT*shot
                if (@shieldPower < 0)
                    @shieldPower = 0
                end
                return ShotResult::RESIST
            else
                @shieldPower = 0
                return ShotResult::DONOTRESIST
            end                
        end

        def loot=(l)
            dealer = CardDealer.instance

            h = l.nHangars
            if (h > 0)
                han = dealer.nextHangar
                receiveHangar(han)
            end

            i = 0
            elements = l.nSupplies
            while (i < elements)
                sup = dealer.nextSuppliesPackage
                receiveSupplies(sup)
                i += 1
            end

            i = 0
            elements = l.nWeapons
            while (i < elements)
                weap = dealer.nextWeapon
                receiveWeapon(weap)
                i += 1
            end
            
            i = 0
            elements = l.nShields
            while (i < elements)
                sh = dealer.nextShieldBooster
                receiveShieldBooster(sh)
                i += 1
            end

            medals = l.nMedals
            @nMedals += medals
    
            if (l.efficient)
                Transformation::GETEFFICIENT
            elsif (l.spaceCity)
                Transformation::SPACECITY
            else
                Transformation::NOTRANSFORM
            end
        end

        def discardWeapon(i)
            size = weapons.length
            if (i >= 0 && i < size)
                w = weapons.delete_at(i)
                if (@pendingDamage != nil)
                    @pendingDamage.discardWeapon(w)
                    cleanPendingDamage
                end
            end
        end

        def discardShieldBooster(i)
            size = shieldBoosters.length
            if (i >= 0 && i < size)
                s = shieldBoosters.delete_at(i)
                if (@pendingDamage != nil)
                    @pendingDamage.discardShieldBooster
                    cleanPendingDamage
                end
            end
        end

        def to_s
            getUIversion.to_s
        end
    end # class SpaceStation
end # module Deepspace
