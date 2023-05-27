require_relative 'SpaceStation'

module Deepspace
    class SpaceCity < SpaceStation


        def initialize(base, rest)
            super(base)
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

        def loot=(l)
            super(l) 
            return Transformation::NOTRANSFORM         
        end

        def getUIversion
            return SpaceCityToUI.new(self)
        end

        def to_s
            getUIversion.to_s
        end

end