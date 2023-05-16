#encoding: utf-8

require_relative 'SuppliesPackage'
require_relative 'Hangar'
require_relative 'Damage'
require_relative 'Weapon'
require_relative 'WeaponType'
require_relative 'Loot'
require_relative 'ShieldBooster'
require_relative 'CardDealer'
require_relative 'SpaceStationToUI'
require_relative 'SpaceStation'

module Deepspace
    supplies = Deepspace::SuppliesPackage.new(1,2,3)
    prueba = Deepspace::SpaceStation.new("Prueba",supplies)
    hangar = Deepspace::Hangar.new(4)
    weapon = Deepspace::Weapon.new('arma', Deepspace::WeaponType::PLASMA, 8)
    shield = Deepspace::ShieldBooster.new('escudo', 2, 2)
    prueba.receiveHangar(hangar)
    prueba.receiveWeapon(weapon)
    prueba.receiveWeapon(weapon)
    prueba.receiveShieldBooster(shield)
    prueba.receiveShieldBooster(shield)
    prueba.mountWeapon(0)
    prueba.mountShieldBooster(0)
    prueba.mountWeapon(0)
    prueba.mountShieldBooster(0)
    puts prueba.weapons
    puts prueba.shieldBoosters
    puts 'prueba'
    puts prueba.fire
    puts 'prueba_fire'
    puts prueba.protection
    puts 'prueba_protection'
    puts prueba.receiveShot(2.0)
    puts prueba.shieldPower
    sp = Deepspace::SuppliesPackage.new(0,0,0)
    loot = Deepspace::Loot.new(1,2,3,4,5)
    prueba2 = Deepspace::SpaceStation.new("pruebaa",sp)
    prueba2.loot=loot
    puts prueba2.to_s
    puts "____________________________________"
    puts prueba.weapons
    puts prueba.shieldBoosters
    prueba.discardWeapon(1)
    prueba.discardShieldBooster(1)
    puts prueba.to_s
end