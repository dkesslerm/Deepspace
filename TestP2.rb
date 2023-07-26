#encoding:utf-8

require_relative "Damage"
require_relative "Weapon"
require_relative "ShieldBooster"
require_relative "WeaponType"
require_relative "DamageToUI"
require_relative "SpecificDamage"
require_relative "NumericDamage"

module Deepspace
    class TestP2
        def self.main
            puts "Probando DAMAGE: "
            puts "--------------------------------------------------------------"
            weapons = []
            weapons.push(WeaponType::LASER)
            weapons.push(WeaponType::MISSILE)
            weapons.push(WeaponType::PLASMA)
            weapons.push(WeaponType::PLASMA)
            d_n = NumericDamage.new(weapons.length, 4)
            d_s = SpecificDamage.new(weapons, 4)
            puts d_n.to_s
            puts ""
            puts d_s.to_s
            puts ""
            puts ""

            w_prueba = []
            #w_prueba.push(Weapon.new("laser", WeaponType::LASER, 2))
            #w_prueba.push(Weapon.new("plasma", WeaponType::PLASMA, 2))
            w_prueba.push(Weapon.new("plasma2", WeaponType::PLASMA, 2))

            escudos = []
            escudos.push(ShieldBooster.new("escudo1", 3, 2))

            adjust_dn = d_n.adjust(w_prueba, escudos)
            adjust_ds = d_s.adjust(w_prueba, escudos)
            puts adjust_dn.to_s
            puts ""
            puts adjust_ds.to_s
            puts ""
            
        end
    end

    TestP2.main
end