#encoding:utf-8

require_relative 'EnemyToUI'
require_relative 'Loot'
require_relative 'Damage'
require_relative 'ShotResult'

module Deepspace

    class EnemyStarShip

        def intialize(n,a,s,l,d)
            @name=n
            @ammoPower=a
            @shieldPower=s
            @loot=l
            @damage=d
        end

        def self.newCopy(e)
            initialize(e.name,e.ammoPower,e.shieldPower,e.loot,e.damage)
        end

        def getUIVersion
            EnemyToUI.new(self)
        end

        public
        
        def fire
            ammoPower
        end

        def ammoPower
            @ammoPower
        end

        def damage
            @damage
        end

        def loot
            @loot
        end

        def name
            @name
        end

        def shieldPower
            @shieldPower
        end

        def protection
            shieldPower
        end

        def receiveShot(shot)
            if (shot > protection)
                return ShotResult::DONOTRESIST
            else
                return ShotResult::RESIST
            end
        end

        def to_s
            out = "Name " + name + ", AmmoPower: " + ammoPower + ", ShieldPower: " + shieldPower + ", Loot: " + loot.to_s
            out += ", Damage: " + damage.to_s
        end

    end

end
