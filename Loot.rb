#encoding:utf-8
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
    end
end
