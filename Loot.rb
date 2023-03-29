#encoding:utf-8

require_relative 'LootToUI.rb'

module DeepSpace
    class Loot


        def initialize(su, we, sh, ha, me)
            @nSupplies=su
            @nWeapons=we
            @nShields=sh
            @nHangars=ha
            @nMedals=me
        end

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

        def getUIVersion
            return LootToUI.new(self)
        end

        def to_s
            getUIVersion.to_s
    end
end
