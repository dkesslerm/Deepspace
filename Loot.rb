#encoding:utf-8
require_relative "LootToUI"

module Deepspace
    
    class Loot

        def initialize(s, w, sh, h, m, ef = false, city = false)
            @nSupplies = s
            @nWeapons = w
            @nShields = sh
            @nHangars = h
            @nMedals = m
            @efficient = ef
            @spaceCity = city
        end

        def getUIversion
            LootToUI.new(self)
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

        def efficient
            @efficient
        end

        def spaceCity
            @spaceCity
        end

        def to_s
            getUIversion.to_s
        end
    end
end