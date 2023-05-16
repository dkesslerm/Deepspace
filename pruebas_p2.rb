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
    puts prueba.name
    puts prueba.ammoPower
    puts prueba.fuelUnits
    puts prueba.nMedals
    puts prueba.shieldPower
    puts prueba.pendingDamage
    puts prueba.weapons
    puts prueba.shieldBoosters
    puts prueba.hangar
    puts prueba.to_s
    hangar = Deepspace::Hangar.new(4)
    weapon = Deepspace::Weapon.new('arma', Deepspace::WeaponType::PLASMA, 8)
    shield = Deepspace::ShieldBooster.new('escudo', 1, 1)
    puts prueba.receiveWeapon(weapon)
    puts prueba.receiveShieldBooster(shield)
    prueba.receiveHangar(hangar)
    puts prueba.receiveWeapon(weapon)
    puts prueba.receiveShieldBooster(shield)
    puts prueba.hangar
    prueba.mountWeapon(0)
    prueba.mountShieldBooster(0)
    puts prueba.hangar
    puts prueba.weapons
    puts prueba.shieldBoosters
    prueba.discardHangar
    puts prueba.hangar
    prueba.receiveHangar(hangar)
    puts prueba.receiveWeapon(weapon)
    puts prueba.receiveShieldBooster(shield)
    puts prueba.hangar
    prueba.discardWeaponInHangar(0)
    prueba.discardShieldBoosterInHangar(0)
    puts prueba.hangar
    puts prueba.speed
    puts prueba.fuelUnits
    prueba.move
    puts prueba.fuelUnits
    weapon2 = Deepspace::Weapon.new('arma', Deepspace::WeaponType::PLASMA, 0)
    puts prueba.receiveWeapon(weapon2)
    prueba.mountWeapon(0)
    puts prueba.weapons 
    puts "---"
    prueba.cleanUpMountedItems
    puts 'funciona'
    puts prueba.weapons
    puts prueba.validState
    puts 'prueba'
    damage = Deepspace::Damage.newNumericWeapons(2,2)
    prueba.pendingDamage = damage
    puts prueba.pendingDamage
    puts prueba.validState
    puts 'Todo funciona'
 end