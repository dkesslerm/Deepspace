#encoding: utf-8

module DeepSpace

    class TestP1

        def main
            
            # Loot

            l=Loot.new(1,2,3,4,5)

            print 'Supplies = ', l.nSupplies
            print 'Weapons = ', l.nWeapons
            print 'Shields = ', l.nShields
            print 'Hangars = ', l.nHangars
            print 'Medals = ', l.nMedals


            # SuppliesPackage

            su=SuppliesPackage.new(1.0,2.0,3.0)

            print 'AmmoPower = ', su.ammoPower
            print 'FuelUnits = ', su.fuelUnits
            print 'ShieldPower = ', su.shieldPower

            # ShieldBooster

            sh=ShieldBooster.new



        end

    end

    if (__FILE__ == "test_p1.rb")

        t=TestP1.new
        t.main

    end


end
