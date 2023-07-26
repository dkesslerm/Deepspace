#encoding:utf-8
require_relative "SpaceCityToUI"
require_relative "SpaceStation"

module Deepspace
    class SpaceCity < SpaceStation

        def initialize(b, rest)
            copy(b)
            @base = b
            @collaborators = []
            rest.each do |ss|
                @collaborators.push(ss)
            end
        end

        def collaborators
            @collaborators
        end

        def fire
            pow = super
            @collaborators.each do |ss|
                pow += ss.fire
            end
            pow
        end

        def protection
            prot = super
            @collaborators.each do |ss|
                prot += ss.protection
            end
            prot
        end

        def loot= (l)
            super(l)
            Transformation::NOTRANSFORM
        end

        def getUIversion
            SpaceCityToUI.new(self)
        end

        def to_s
            getUIversion.to_s
        end
    end
end




