#encoding:utf-8
require_relative "Weapon"
require_relative "WeaponType"
require_relative "ShieldBooster"
require_relative "Hangar"
require_relative "Loot"
require_relative "NumericDamage"
require_relative "SpecificDamage"
require_relative "EnemyStarShip"
require_relative "SuppliesPackage"
require_relative "SpaceStation"
require_relative "GameUniverse"
require_relative "SpaceCity"
require_relative "PowerEfficientSpaceStation"
require_relative "BetaPowerEfficientSpaceStation"

module Deepspace
    class TestToS

        def self.main

            w = Weapon.new("nombre1", WeaponType::LASER, 3)
            print w.to_s
            puts "\n******************************"

            s = ShieldBooster.new("nombre2", 3, 2)
            print s.to_s
            puts "\n******************************"

            h = Hangar.new(3)
            h.addWeapon(w)
            h.addShieldBooster(s)
            h2 = Hangar.newCopy(h)
            print h.to_s
            puts "\n******************************"
            print h2.to_s
            puts "\n******************************"

            l = Loot.new(1, 1, 2, 1, 1)
            print l.to_s
            puts "\n******************************"
            
            nd = NumericDamage.new(3, 2)
            print nd.to_s
            puts "\n******************************"

            wt = WeaponType::LASER
            print wt.to_s
            puts "\n******************************"

            wl = []
            wl.push(wt)
            sd = SpecificDamage.new(wl, 3)
            print sd.to_s
            puts "\n******************************"

            enemy = EnemyStarShip.new("enemy1", 2, 3, l, nd)
            print enemy.to_s
            puts "\n******************************"

            sp = SuppliesPackage.new(2, 3, 4)
            print sp.to_s
            puts "\n******************************" 

            ss = SpaceStation.new("ss1", sp)
            print ss.to_s
            puts "\n******************************"

            gu = GameUniverse.new
            gu.init(["name1", "name2"])
            print gu.to_s
            puts "\n******************************"
            puts "\n******************************"

            aux = []
            aux.push(SpaceStation.new("collaborator1", sp))
            sc = SpaceCity.new(ss, aux)
            print sc.to_s
            puts "\n******************************"
            puts "\n******************************"

            pess = PowerEfficientSpaceStation.new(ss)
            print pess.to_s
            puts "\n******************************"
            puts "\n******************************"

            bpess = BetaPowerEfficientSpaceStation.new(pess)
            print bpess.to_s
            puts "\n******************************"
            puts "\n******************************"
        end

    end
end

Deepspace::TestToS.main