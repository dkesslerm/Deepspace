#encoding:utf-8
require_relative "SpaceCity"
require_relative "SpaceStation"
require_relative "PowerEfficientSpaceStation"
require_relative "BetaPowerEfficientSpaceStation"
require_relative "SuppliesPackage"
require_relative "GameUniverse"
require_relative "Controller"

module Deepspace

    class TestHerencia

        def self.main

            ss1 = SpaceStation.new("ss1", SuppliesPackage.new(1, 2, 3))
            ss2 = SpaceStation.new("ss2", SuppliesPackage.new(1, 2, 3))
            ss3 = SpaceStation.new("ss3", SuppliesPackage.new(1, 2, 3))
            ss4 = SpaceStation.new("ss4", SuppliesPackage.new(1, 2, 3))

            collaborators = []
            collaborators.push(ss2)
            collaborators.push(ss3)
            collaborators.push(ss4)

            puts "\n******************************"

            sc = SpaceCity.new(ss1, collaborators)

            puts sc.inspect
        
            puts sc.fire
            puts sc.protection
            
            puts "\n******************************"

            pess = PowerEfficientSpaceStation.new(ss1)
            bpess = BetaPowerEfficientSpaceStation.new(ss1)

            puts ss1.fire
            puts pess.fire
            3.times do 
                puts bpess.fire
            end

            puts "\n******************************"

            gu = GameUniverse.new
            co = Controller::Controller.instance
            gu.init(["name1", "name2"])

            puts gu.currentStation.to_s
            
            puts "\n******************************"

            gu.createSpaceCity
            puts gu.currentStation.to_s

            puts "\n******************************"

            gu.makeStationEfficient
            puts gu.currentStation.to_s

            puts "\n******************************"

            gu.currentStation.loot=(Loot.new(1, 2, 2, 1, 1, false, false))
            puts gu.currentStation.to_s
        end
    end
end

Deepspace::TestHerencia.main 