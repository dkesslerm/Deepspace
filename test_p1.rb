#encoding: utf-8

module DeepSpace

    class TestP1

        def main
            
            # Loot

            l=Loot.new(1,2,3,4,5)

            puts 'Supplies = ', l.nSupplies
            puts 'Weapons = ', l.nWeapons
            puts 'Shields = ', l.nShields
            puts 'Hangars = ', l.nHangars
            puts 'Medals = ', l.nMedals


            # SuppliesPackage

            su=SuppliesPackage.new(1.0,2.0,3.0)

            puts 'AmmoPower = ', su.ammoPower
            puts 'FuelUnits = ', su.fuelUnits
            puts 'ShieldPower = ', su.shieldPower

            # ShieldBooster

            sh=ShieldBooster.new('name', 2.0, 1)
            
            puts 'Boost = ', sh.boost
            puts 'Uses = ', sh.uses

            # Weapon 
            
            w=Weapon.new('name', wt=WeaponType.laser, 3)

            puts 'Type = ', w.type
            puts 'Uses = ', w.uses
            puts 'Weapon power = ', w.power

            # Dice

            d=Dice.new()

            for i in 1..100 do
                if(d.)
            end

        end

    end

    if (__FILE__ == "test_p1.rb")

        t=TestP1.new
        t.main

    end


end
