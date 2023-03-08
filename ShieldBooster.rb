#encoding: utf-8

module DeepSpace

    class ShieldBooster

        def initialize(n,b,u)
            @name=n
            @boost=b
            @uses=u
        end

        # Constructor de copia 
        def newCopy(s)
            self.new(s.name, s.boost, s.uses)
        end

        def boost
            @boost
        end

        def uses
            @uses
        end

        def useIt
            if (uses > 0)
                uses--
                boost

            else
                1.0
            end
        end

    end

end