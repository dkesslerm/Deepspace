require_relative 'SpaceStation'

module Deepspace
    class SpaceCity < SpaceStation
        def initialize(base, rest)
            @base = base
            @collaborators = rest
        end

        public:

        def collaborators
            @collaborators
        end

        def fire
            dam = super
            collaborators.each do |ss|
                dam += ss.fire
            end
            dam
        end

        def protection
            prot = super
            collaborators.each do |ss|
                prot += ss.protection
            end
            prot
        end

        def setLoot
            super 
            if (super != Transformation.NOTRANSFORM)
                return Transformation.NOTRANSFORM
            end            
        end

        def base
            @base
        end


end