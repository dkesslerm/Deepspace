#encoding:utf-8


module DeepSpace
    class GameUniverse
        @@WIN = 10

        def initialize()
            @currentStationIndex = 0
            @turns = 0
        end

        def combat(ss)