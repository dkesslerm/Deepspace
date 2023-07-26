#encoding:utf-8
require_relative "DamageToUI"

module Deepspace

    class Damage

        def initialize(s)
            @nShields = s
        end                

        def getUIversion
            DamageToUI.new(self)
        end

        public

        def nShields
            @nShields
        end

        def discardShieldBooster
            if (@nShields > 0)
                @nShields -= 1
            else
                @nShields = 0
            end
        end

        def adjustShields(s)
            nShields_new = @nShields
            if (nShields_new > s.length)
                nShields_new = s.length
            end

            nShields_new
        end

        def to_s
            getUIversion.to_s
        end

    end # class Damage
end # module Deepspace


                

                

        
