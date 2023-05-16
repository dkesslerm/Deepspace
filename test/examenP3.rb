#encoding:utf-8
require_relative 'CardDealer'
require_relative 'SpaceStation'
require_relative 'GameUniverse'

module Prueba

    class Examen
        def self.main
            puts "Hello World! Im Carber"

            dealer = Deepspace::CardDealer.instance

            # Quitar Puts
            puts un_suministro = dealer.nextSuppliesPackage
            un_arma = dealer.nextWeapon
            un_potenciador = dealer.nextShieldBooster
            un_hangar = dealer.nextHangar
            un_enemigo = dealer.nextEnemy

            puts "---------------------------------------"

            puts un_suministro.class
            puts un_arma.class
            puts un_potenciador.class
            puts un_hangar.class
            puts un_enemigo.class

            puts "---------------- Creamos estación espacial ----------------"

            puts mi_base = Deepspace::SpaceStation.new("Mi Base del Examen", un_suministro)
            mi_game_universe = Deepspace::GameUniverse.new()
            mi_game_universe.init(["prueba"])
            puts mi_game_universe

            # COMBATE
            mi_game_universe.combatGo(mi_base, un_enemigo)

            puts self.name
        end
    end

end

Prueba::Examen.main