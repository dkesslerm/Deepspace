#encoding:utf-8

require_relative 'EnemyToUI.rb'
require_relative 'Loot.rb'
require_relative 'Damage.rb'
require_relative 'ShotResult.rb'

module DeepSpace

    class EnemyStarShip

        def intialize(n,a,s,l,d)
            @name=n
            @ammoPower=a
            @shieldPower=s
            @loot=l
            @damage=d
        end

        def self.newCopy(e)
            @name=e.name
            @ammoPower=e.ammoPower
            @shieldPower=e.shieldPower
            @loot=e.loot
            @damage=e.damage
        end

        def getUIVersion
            EnemyToUI.new(self)
        end

        def fire

        end

        def getAmmoPower

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

        end

        def receiveShot(shot)

        end

    end

end
