#encoding:utf-8

module Deepspace

    class Dice

        def initialize
            @NHANGARSPROB = 0.25
            @NSHIELDSPROB = 0.25
            @NWEAPONSPROB = 0.33
            @FIRSTSHOTPROB = 0.5
            @EXTRAEFFICIENCYPROB = 0.8
            @generator = Random.new
        end

        def initWithNHangars
            if (@generator.rand <= @NHANGARSPROB)
                return 0
            else
                return 1
            end
        end

        def initWithNWeapons
            num = @generator.rand
            if (num <= @NWEAPONSPROB)
                return 1
            elsif (num <= 2*@NWEAPONSPROB)
                return 2
            else
                return 3
            end
        end

        def initWithNShields
            if (@generator.rand <= @NSHIELDSPROB)
                return 0
            else
                return 1
            end
        end

        def whoStarts(n)
            @generator.rand(n)
        end

        def firstShot
            if (@generator.rand <= @FIRSTSHOTPROB)
                return GameCharacter::SPACESTATION
            else
                return GameCharacter::ENEMYSTARSHIP
            end
        end

        def spaceStationMoves(s)
            return (@generator.rand <= s)
        end

        def extraEfficiency
            return (@generator.rand <= @EXTRAEFFICIENCYPROB)
        end
    end
end

        


            
            
        



