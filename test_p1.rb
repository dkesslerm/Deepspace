#encoding: utf-8

require_relative 'Loot.rb'
require_relative 'SuppliesPackage.rb'
require_relative 'ShieldBooster.rb'
require_relative 'Weapon.rb'
require_relative 'Dice.rb'
require_relative 'WeaponType.rb'

module Deepspace

    class TestP1

        NSUPPLIES = 1
        NWEAPONS = 2
        NSHIELDS = 3
        NHANGARS = 4
        NMEDALS = 5

        AMMOPOWER=1.0
        FUELUNITS=2.0
        SHIELDPOWER=3.0

        BOOST=2.0
        USES=3

        def self.main
            
            # Loot

            l=Loot.new(NSUPPLIES,NWEAPONS,NSHIELDS,NHANGARS,NMEDALS)
            
            puts 'Loot:'
            print 'Supplies = ', l.nSupplies
            puts
            print 'Weapons = ', l.nWeapons
            puts
            print 'Shields = ', l.nShields
            puts
            print 'Hangars = ', l.nHangars
            puts
            print 'Medals = ', l.nMedals
            puts
            puts

            # SuppliesPackage

            su=SuppliesPackage.new(AMMOPOWER,FUELUNITS,SHIELDPOWER)

            print 'SuppliesPackage:'
            puts
            print 'AmmoPower = ', su.ammoPower
            puts
            print 'FuelUnits = ', su.fuelUnits
            puts
            print 'ShieldPower = ', su.shieldPower
            puts
            puts

            # ShieldBooster

            sh=ShieldBooster.new('name', BOOST, USES)
            
            puts 'ShieldBooster:'
            print 'Boost = ', sh.boost
            puts
            print 'Uses = ', sh.uses
            puts
            puts

            # Weapon 
            
            
            w=Weapon.new('name', WeaponType::LASER, USES)

            puts 'Weapon:'
            print 'Uses = ', w.uses
            puts
            print 'Weapon power = ', w.power
            puts
            puts

            # Dice
            puts 'Dice:'
            d=Dice.new()
            nHangars=0
            nWeapons1=0
            nWeapons2=0
            nShields=0
            spaceStation=0

            for i in 1..100 do
                n=d.initWithNHangars
                if(n == 1)
                    nHangars += 1
                end
                
                n=d.initWithNWeapons
                if(n == 1)
                    nWeapons1 += 1

                elsif(n == 2)
                    nWeapons2 += 1

                end

                n=d.initWithNShields
                if(n == 1)
                    nShields += 1
                end

                if(d.firstShot == GameCharacter::SPACESTATION)
                    spaceStation += 1
                end
                
            end

            probWeapon1 = nWeapons1*1.0/100
            probWeapon2 = nWeapons2*1.0/100
            probWeapon3 = 1-probWeapon1-probWeapon2
            probHangars1 = nHangars*1.0/100
            probHangars0 = 1-probHangars1
            probShields1 = nShields*1.0/100
            probShields0 = 1-probShields1
            probSpaceStation = spaceStation*1.0/100

            puts 'Resultados métodos de dice obtenidos a partir de 100 iteraciones'
            puts 'Probabilidad iniciar con 1 arma = ', probWeapon1
            puts 'Probabilidad iniciar con 2 armas = ', probWeapon2
            puts 'Probabilidad iniciar con 3 armas = ', probWeapon3

            puts  'Probabilidad iniciar con 0 hangares = ', probHangars0
            puts  'Probabilidad iniciar con 1 hangar = ', probHangars1

            puts  'Probabilidad iniciar con 0 escudos = ', probShields0
            puts  'Probabilidad iniciar con 1 escudos = ', probShields1

            puts 'Probabilidad de tener primer disparo = ', probSpaceStation

        end

    end

    if (__FILE__ == "test_p1.rb")

        TestP1.main

    end


end
