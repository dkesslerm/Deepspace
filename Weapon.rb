#encoding: utf-8

require_relative 'WeaponToUI'
require_relative 'WeaponType'

module Deepspace

    class Weapon

        def initialize(n,t,u)
            @name=n
            @type=t
            @uses=u
        end

        #Constructor de copia
        def self.newCopy(w)
            self.new(w.name, w.type, w.uses)
        end

        def getUIVersion
            return WeaponToUI.new(self)
        end

        public

        def type
            @type
        end

        def uses
            @uses
        end

        def name
            @name
        end
        
        def power
            @type.power
        end

        def useIt
            if (uses > 0)
                uses--
                power
            else
                1.0
            end
        end

        def to_s
            return getUIVersion.to_s
        end
    end
end
