#encoding: utf-8

require_relative 'ShieldToUI'

module Deepspace

    class ShieldBooster


        def initialize(n,b,u)
            @name=n
            @boost=b
            @uses=u
        end

        # Constructor de copia 
        def self.newCopy(s)
            return new(s.name, s.boost, s.uses)
        end

        def getUIversion
            return ShieldToUI.new(self)
        end

        public

        def boost
            @boost
        end

        def uses
            @uses
        end

        def name
            @name
        end

        def useIt
            if (uses > 0)
                uses -= 1
                return boost
            else
                1.0
            end
        end

        def to_s
            return getUIversion.to_s
        end

    end

end