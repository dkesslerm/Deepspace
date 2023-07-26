#encoding:utf-8
require_relative "ShieldToUI"

module Deepspace

    class ShieldBooster

        def initialize(n, b, u)
            @name = n
            @boost = b
            @uses = u
        end

        def self.newCopy(s)
            self.new(s.name, s.boost, s.uses)
        end

        def getUIversion
            ShieldToUI.new(self)
        end
        
        def name
            @name
        end

        def boost
            @boost
        end

        def uses
            @uses
        end

        def useIt
            if (@uses > 0)
                @uses -= 1
                return boost
            else
                return 1.0
            end
        end

        def to_s
            getUIversion.to_s
        end
    end
end

        




        