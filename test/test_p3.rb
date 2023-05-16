
require_relative 'GameUniverse'
require_relative 'CardDealer'
require_relative 'Hangar'

module Deepspace

    class Test_p3

        def self.main

            dealer = CardDealer.instance
            hangar = dealer.nextHangar()
            hangar = Hangar.new(6)
            hang2 = Hangar.newCopy(hangar)
            puts hangar.to_s
            puts hang2.to_s
            if (hangar.nil?)
                puts "nil"
            end

        end

    end
    Test_p3.main
end
