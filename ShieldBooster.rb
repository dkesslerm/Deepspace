#encoding: utf-8

require_relative 'ShieldToUI.rb'

module DeepSpace

    class ShieldBooster


        def initialize(n,b,u)
            @name=n
            @boost=b
            @uses=u
        end

        # Constructor de copia 
        def self.newCopy(s)
            new(s.name, s.boost, s.uses)
        end

        def getUIVersion
            return ShieldToUI.new(self)
        end

        public

        def boost
            @boost
        end

        def uses
            @uses
        end

        def useIt
            if (uses > 0)
                uses -= 1
                boost
            else
                1.0
            end
        end

        def to_s
            return "Name: #{@name}, " + getUIVersion.to_s
        end

    end

end