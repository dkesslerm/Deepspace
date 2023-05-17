#encoding:utf-8

require_relative 'Weapon'
require_relative 'WeaponType'
require_relative 'Hangar'
require_relative 'Damage'
require_relative 'SuppliesPackage'
require_relative 'SpaceStation'

module Deepspace

class Examen

    @@NUM_ARMAS = 6
    @@SEPARADOR = "----------------------------------------------------------"
    def main

        laser = Weapon.new("Laser",WeaponType::LASER,1)
        misil = Weapon.new("Misil",WeaponType::MISSILE,1)
        plasma = Weapon.new("Plasma",WeaponType::PLASMA,1)
        armas = []

        i=0
        while i < 1
            armas.push(WeaponType::LASER)
            i += 1
        end

        i=0
        while i < 2
            armas.push(WeaponType::MISSILE)
            i += 1
        end

        i=0
        while i < 3
            armas.push(WeaponType::PLASMA)
            i += 1
        end

        dam = Damage.newSpecificWeapons(armas,0)

        puts dam
        puts @@SEPARADOR

        suminisitros = SuppliesPackage.new(1,1,1)
        estacion = SpaceStation.new("estacion_prueba",suminisitros)
        hangar = Hangar.new(@@NUM_ARMAS)
        estacion.receiveHangar(hangar)
        puts estacion
        puts @@SEPARADOR

        i=0
        while i < 3
            estacion.receiveWeapon(laser)
            i += 1
        end

        i=0
        while i < 2
            estacion.receiveWeapon(misil)
            i += 1
        end

        i=0
        while i < 1
            estacion.receiveWeapon(plasma)
            i += 1
        end

        i=0
        while i < @@NUM_ARMAS
            estacion.mountWeapon(0)
            i+=1
        end

        puts estacion
        puts @@SEPARADOR

        estacion.pendingDamage=dam
        puts estacion
        puts @@SEPARADOR



    end



end

ex = Examen.new

ex.main

end