#encoding:utf-8

require_relative 'LootToUI'

module Deepspace
    class Loot

        def initialize(su, we, sh, ha, me, ef, city)
            @nSupplies=su
            @nWeapons=we
            @nShields=sh
            @nHangars=ha
            @nMedals=me
            @getEfficient=ef
            @spaceCity=city
        end

        def getUIversion
            return LootToUI.new(self)
        end

        public

        def nSupplies
            @nSupplies
        end

        def nWeapons
            @nWeapons
        end

        def nShields
            @nShields
        end

        def nHangars
            @nHangars
        end

        def nMedals
            @nMedals
        end

        def getEfficient
            @getEfficient
        end

        def spaceCity
            @spaceCity
        end

        def to_s
            getUIVersion.to_s
        end
        
    end
end
