#encoding: utf-8

module DeepSpace

    class Weapon

        def initialize(n,t,u)
            @name=n
            @type=t
            @uses=u
        end

        #Constructor de copia
        def newCopy(w)
            self.new(w.name, w.type, w.uses)
        end

        def type
            @type
        end

        def uses
            @uses
        end

        def power
            @type.ammoPower
        end

        def useIt
            if (uses > 0)
                uses--
                power
            else
                1.0
            end
        end

    end
end
