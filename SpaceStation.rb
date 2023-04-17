#encoding:utf-8

require_relative 'SpaceStationToUI'
require_relative 'Hangar'
require_relative 'SuppliesPackage'
require_relative 'ShieldBooster'
require_relative 'Weapon'
require_relative 'Hangar'
require_relative 'Damage'
require_relative 'Loot'
require_relative 'ShotResult'
require_relative 'CardDealer'

module Deepspace
    class SpaceStation

        def intialize(n,supplies)
            @name=n
            @ammoPower=supplies.ammoPower
            @fuelUnits=supplies.fuelUnits
            @shieldPower=supplies.shieldPower
            @pendingDamage=nil
            @nMedals = nil
            @hangar = nil
            @weapons = nil
            @shieldBoosters = nil
        end
        
        private

        # Máx cantidad de unidades de combustible que puede tener una estación espacial
        @@MAXFUEL=100
        # Unidades de escudo que se pierden por unidad de potencia de disparo recibido
        @@SHIELDLOSSPERUNITSHOT=0.1

        def assignFuelValue(f)
            if (f > @@MAXFUEL)
                @fuelUnits=@@MAXFUEL
            elsif (f > 0)
                @fuelUnits=f
            else
                @fuelUnits=0
            end
        end

        def cleanPendingDamage
            if(@pendingDamage.nBoosters==0)
                if (@pendingDamage.nWeapons==0)
                    @pendingDamage=nil
                elsif (@pendingDamage.nWeapons==-1 && @pendingDamage.weapons.emty?)
                    @pendingDamage=nil
                end
            end
        end

        public
        
        attr_reader :ammoPower, :fuelUnits, :hangar, :name, :nMedals, :pendingDamage, :shieldBoosters, :weapons

        def cleanUpMountedItems
            @weapons.each do |we|
                if (we.uses==0)
                    @weapons.delete(we)
                end
            end
            @shieldBoosters.each do |sh|
                if (sh.uses==0)
                    @shieldBoosters.delete(sh)
                end
            end
        end

        def discardHangar
            @hangar=nil
        end

        def discardShieldBooster(i)
            if (!@hangar.nil?)
                @hangar.shieldBoosters.delete_at(i)
            end
        end

        def discardWeaponInHangar(i)
            if (!@hangar.nil?)
                @hangar.weapons.delete_at(i)
            end
        end

        def fire
            size = @weapons.size
            factor = 1
            @weapons.each do |w|
                factor = w * w.useIt
            end 

            @ammoPower * factor                
        end

        def getUIversion
            SpaceStationToUI.new(self)
        end

        def mountShieldBooster(i)
            if(!@hangar.nil? && @hangar.shieldBoosters.length > i)
                sh=@hangar.shieldBoosters.delete_at(i)
                @shieldBoosters.push(sh)
            end
        end

        def mountWeapon(i)
            if(!@hangar.nil? && @hangar.weapons.length > i)
                we=@hangar.weapons.delete_at(i)
                @weapons.push(we)
            end
        end

        def move
            assignFuelValue(@fuelUnits-speed)
        end

        def protection
            size = @shieldBoosters.size
            factor = 1
            @shieldBoosters.each do |s|
                factor = s * s.useIt
            end 

            @shieldPower * factor
        end

        def receiveHangar(h)
            if (@hangar.nil?)
                @hangar=h
            end
        end

        def receiveShieldBooster(s)
            if (!@hangar.nil?)
                return @hangar.addShieldBooster(s)
            else
                return false
            end
        end

        def receiveShot(shot)
            myProtection = protection
            if (myProtection >= shot)
                @shieldPower -= SHIELDLOSSPERUNITSHOT * shot
                if (0 > @shieldPower)
                    @shieldPower = 0.0
                end
                ShotResult::RESIST
            else 
                @shieldPower = 0.0
                ShotResult::DONOTRESIST  
            end
        end

        def receiveSupplies(s)
            @ammoPower += s.ammoPower
            @shieldPower += s.shieldPower
            assignFuelValue(fuelUnits+s.fuelUnits)
        end

        def receiveWeapon(w)
            if (!@hangar.nil?)
                return @hangar.addWeapon(w)
            else
                return false
            end
        end

        def loot=(l)
            dealer = CardDealer.new

            h = l.nHangars
            if (h > 0)
                hangar = dealer.nextHangar
                receiveHangar(hangar)
            end

            elements = l.nSupplies
            i = 0
            while i < elements
                sup = dealer.nextSuppliesPackage
                receiveSupplies(sup)
                i += 1
            end

            elements = l.nWeapons
            i = 0
            while i < elements
                weap = dealer.nextWeapon
                receiveWeapon(weap)
                i += 1
            end

            elements = l.nShields
            i = 0
            while i < elements
                sh = dealer.nextShieldBooster
                receiveShieldBooster(sh)
                i += 1
            end

            medals = nMedals
            @nMedals += medals
        end

        def pendingDamage=(d)
            @pendingDamage=d.adjust(@weapons,@shieldBoosters)
        end

        def validState
            cleanPendingDamage
            return (@pendingDamage==nil)
        end

        def to_s
            getUIVersion.to_s
        end

        def speed
            return (@fuelUnits/@@MAXFUEL)
        end

        def discardWeapon(i)
            size = @weapons.size
            if (i >= 0 && i < size)
                w = @weapons.delete_at(i)
                if (@pendingDamage != nil)
                    @pendingDamage.discardWeapon(w)
                    cleanPendingDamage
                end
            end
        end

        def discardShieldBooster(i)
            size = @shieldBoosters.size
            if (i >= 0 && i < size)
                s = @shieldBoosters.delete_at(i)
                if (@pendingDamage != nil)
                    @pendingDamage.discardShieldBooster
                    cleanPendingDamage
                end
            end
        end


    end
end


        
