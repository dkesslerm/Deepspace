#encoding: utf-8

require_relative 'GameCharacter'


module Deepspace

    
    class Dice

        def initialize()
            @NHANGARSPROB=0.25
            @NSHIELDSPROB=0.25
            @NWEAPONSPROB=0.33
            @FIRSTSHOTPROB=0.5
            @generator=Random.new
        end

        public

        def initWithNHangars
            if (@generator.rand <= @NHANGARSPROB)
                return 0
            else
                return 1
            end
        end

        def initWithNWeapons
            if(@generator.rand <= @NWEAPONSPROB)
                return 1
            
            elsif (@generator.rand <= 2*@NWEAPONSPROB)
                return 2

            else
                return 3
            end

        end

        def initWithNShields
            if(@generator.rand <= @NSHIELDSPROB)
                return 0
            else
                return 1
            end
            
        end

        def whoStarts(nPlayers)
            @generator.rand(nPlayers)
        end

        def firstShot
            if(@generator.rand <= @FIRSTSHOTPROB)
                GameCharacter::SPACESTATION
            else
                GameCharacter::ENEMYSTARSHIP
            end
        end
        
        def spaceStationMoves(speed)
            (@generator.rand <= speed)
        end

    end

end
