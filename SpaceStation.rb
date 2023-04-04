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

        # Máx cantidad de unidades de combustible que puede tener una estación espacial
        @@MAXFUEL=100
        # Unidades de escudo que se pierden por unidad de potencia de disparo recibido
        @@SHIELDLOSSPERUNITSHOT=0.1

        def assignFuelValue(f)
            if (f > @@MAXFUEL)
                @fuelUnits=@@MAXFUEL
            else
                @fuelUnits=f
            end
        end

        def cleanPendingDamage
            if(pendingDamage.nBoosters==0)
                if (pendingDamage.nWeapons==0)
                    pendingDamage=nil
                elsif (pendingDamage.nWeapons==-1 && pendingDamage.weapons.emty?)
                    pendingDamage=nil
                end
            end
        end

        public
        
        attr_reader :ammoPower, :fuelUnits, :hangar, :name, :nMedals, :pendingDamage, :shieldBoosters, :weapons

        def cleanUpMountedItems
            weapons.each do |we|
                if (we.uses==0)
                    weapons.delete(we)
                end
            end
            shieldBoosters.each do |sh|
                if (sh.uses==0)
                    shieldBoosters.delete(sh)
                end
            end
        end

        def discardHangar
            hangar=nil
        end

        def discardShieldBooster(i)
            if (!hangar.nil?)
                hangar.shieldBoosters.delete_at(i)
            end
        end

        def discardWeaponInHangar(i)
            if (!hangar.nil?)
                hangar.weapons.delete_at(i)
            end
        end

        def fire

        end

        def getUIversion
            SpaceStationToUI.new(self)
        end

        def mountShieldBooster(i)
            if(!hangar.nil? && hangar.shieldBoosters.length > i)
                sh=hangar.shieldBoosters.delete_at(i)
                shieldBoosters.push(sh)
            end
        end

        def mountWeapon(i)
            if(!hangar.nil? && hangar.weapons.length > i)
                we=hangar.weapons.delete_at(i)
                weapons.push(we)
            end
        end

        def move
            #No entiendo
        end

        def protection

        end

        def receiveHangar(h)
            if (hangar.nil?)
                hangar=h
            end
        end

        def receiveShieldBooster(s)
            if (!hangar.nil?)
                return hangar.addShieldBooster(s)
            else
                return false
            end
        end

        def receiveShot(shot)

        end

        def receiveSupplies(s)
            @ammoPower += s.ammoPower
            @shieldPower += s.shieldPower
            assignFuelValue(fuelUnits+s.fuelUnits)
        end

        def receiveWeapon(w)
            if (!hangar.nil?)
                return hangar.addWeapon(w)
            else
                return false
            end
        end

        def loot=(l)
            # Siguiente práctica
        end

        def pendingDamage=(d)
            @pendingDamage=d.adjust(weapons,shieldBoosters)
        end

        def validState
            cleanPendingDamage
            return (pendingDamage==nil)
        end

        def to_s
            getUIVersion.to_s
        end

        def speed
            return (fuelUnits/@@MAXFUEL)
        end

    end
end


        
