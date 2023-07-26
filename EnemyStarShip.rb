#encoding:utf-8
require_relative "EnemyToUI"

module Deepspace
    
    class EnemyStarShip
        def initialize(n, a, s, l, d)
            @name = n
            @ammoPower = a
            @shieldPower = s
            @loot = l
            @damage = d            
        end

        def self.newCopy(e)
            self.new(e.name, e.ammoPower, e.shieldPower, e.loot, e.damage)
        end

        def getUIversion
            EnemyToUI.new(self)
        end

        def name
            @name
        end

        def ammoPower
            @ammoPower
        end

        def shieldPower
            @shieldPower
        end

        def loot
            @loot
        end

        def damage
            @damage
        end

        def protection
            shieldPower
        end

        def fire
            ammoPower
        end

        def receiveShot(shot)
            if (shot > @shieldPower)
                ShotResult::DONOTRESIST
            else
                ShotResult::RESIST
            end
        end

        def to_s
            getUIversion.to_s
        end
    end # class EnemyStarShip
end # module Deepspace