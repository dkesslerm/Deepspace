#encoding: utf-8

module DeepSpace

    require "Random"
    class Dice

        def initialize()
            @NHANGARSPROB=0.25
            @NSHIELDSPROB=0.25
            @NWEAPONSPROB=0.33
            @FIRSTSHOTPROB=0.5
            @generator=Random.new
        end

        def initWithNHangars
            if (@generator.rand <= @NHANGARSPROB)
                0
            
            else
                1
            end
        end

        def initWithNWeapons
            if(@generator.rand <= @NWEAPONSPROB)
                1
            
            elsif (@generator.rand <= 2*@NWEAPONSPROB)
                2

            else
                3
            end

        end

        def initWithNShields
            if(@generator.rand <= @NSHIELDSPROB)
                0
            else
                1
            end
            
        end

        def whoStarts(nPlayers)
            @generator.rand(nPlayers)
        end

        def firstShot
            if(@generator.rand <= @FIRSTSHOTPROB)
                GameCharacter.SPACESTATION
            else
                GameCharacter.ENEMYSTARSHIP
            end
        end
        
        def spaceStationMoves(speed)
            (@generator.rand <= speed)
        end

        




