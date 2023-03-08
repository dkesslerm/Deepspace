#encoding: utf-8

module DeepSpace

    class TestP1

        def main
            
            loot=Loot.new(1,2,3,4,5)

            # Consultores Loot

            print 'Supplies = ', loot.nSupplies
            print 'Weapons = ', loot.nWeapons
            print 'Shields = ', loot.nShields
            print 'Hangars = ', loot.nHangars
            print 'Medals = ', loot.nMedals

            s=SuppliesPackage.new

            # Consultores SuppliesPackage
            

        end
