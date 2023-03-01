#encoding:utf-8
module DeepSpace
    module WeaponType
        class Type 
            def initialize(p)
                @power=p
            end

            public
            def power
                puts @power
            end
        end

        laser=Type.new(2.0)
        missile=Type.new(3.0)
        plasma=Type.new(4.0)
    end
end