#encoding:utf-8
module DeepSpace
    module WeaponType
        class Type 
            def initialize(p)
                @power=p
            end

            def power
                @power
            end

            def to_s
                if (@power == 2.0)
                    name = "Laser"
                elsif (@power == 3.0)
                    name = "Missile"
                else
                    name = "Plasma"
                end
                return "Name: #{name}, Power: #{@power}"
            end
        end

        LASER = Type.new(2.0)
        MISSILE = Type.new(3.0)
        PLASMA = Type.new(4.0)

    end
end