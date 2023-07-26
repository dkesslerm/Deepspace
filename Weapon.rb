#encoding:utf-8
require_relative "WeaponToUI"

module Deepspace

    class Weapon 
        
        def initialize(n, t, u)
            @name = n
            @type = t
            @uses = u
        end

        def self.newCopy(w)
            self.new(w.name, w.type, w.uses)
        end

        def getUIversion
            WeaponToUI.new(self)
        end

        def name
            @name
        end

        def type
            @type
        end

        def uses
            @uses
        end

        def power
            type.power
        end

        def useIt
            if (@uses > 0)
                @uses -= 1
                return power
            else
                return 1.0
            end
        end

        def to_s
            getUIversion.to_s
        end
    end
end