# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hill_dwarf = Race.create!(
name: "Hill Dwarf",
size: 2,
speed: 30,
vision: 1,
strength_bonus: 0,
dexterity_bonus: 0,
constitution_bonus: 2,
wisdom_bonus: 1,
intelligence_bonus: 0,
charisma_bonus: 0,
languages: "Dwarvish"
)

mountain_dwarf = Race.create!(
name: "Mountain Dwarf",
size: 2,
speed: 30,
vision: 1,
strength_bonus: 2,
dexterity_bonus: 0,
constitution_bonus: 2,
wisdom_bonus: 0,
intelligence_bonus: 0,
charisma_bonus: 0,
languages: "Dwarvish"
)

tiefling = Race.create!(
name: "Mountain Dwarf",
size: 2,
speed: 30,
vision: 1,
strength_bonus: 0,
dexterity_bonus: 0,
constitution_bonus: 0,
wisdom_bonus: 0,
intelligence_bonus: 1,
charisma_bonus: 2,
languages: "Infernal"
)

barbarian = HeroClass.create!(
name: "Barbarian",
hit_dice: "1d12",
level: 1,
strength_saving_throw_proficiency: true,
dexterity_saving_throw_proficiency: false,
constitution_saving_throw_proficiency: true,
wisdom_saving_throw_proficiency: false,
intelligence_saving_throw_proficiency: false,
charisma_saving_throw_proficiency: false,
athletics_proficiency: false,
acrobatics_proficiency: false,
sleight_of_hand_proficiency: false,
stealth_proficiency: false,
arcana_proficiency: false,
history_proficiency: false,
investigation_proficiency: false,
nature_proficiency: false,
religion_proficiency: false,
animal_handling_proficiency: false,
insight_proficiency: false,
medicine_proficiency: false,
perception_proficiency: false,
survival_proficiency: false,
deception_proficiency: false,
intimidation_proficiency: false,
performance_proficiency: false,
persuasion_proficiency: false,
tool_proficiencies: nil,
weapon_proficiencies: "simple weapons, martial weapons",
armor_proficiencies: "light armor, medium armor, shields",
starting_equipment: "greataxe or any martial melee weapon, two handaxes or any simple weapon, explorer's pack, four javelins"
)

wizard = HeroClass.create!(
name: "Wizard",
hit_dice: "1d6",
level: 1,
strength_saving_throw_proficiency: false,
dexterity_saving_throw_proficiency: false,
constitution_saving_throw_proficiency: false,
wisdom_saving_throw_proficiency: true,
intelligence_saving_throw_proficiency: true,
charisma_saving_throw_proficiency: false,
athletics_proficiency: false,
acrobatics_proficiency: false,
sleight_of_hand_proficiency: false,
stealth_proficiency: false,
arcana_proficiency: false,
history_proficiency: false,
investigation_proficiency: false,
nature_proficiency: false,
religion_proficiency: false,
animal_handling_proficiency: false,
insight_proficiency: false,
medicine_proficiency: false,
perception_proficiency: false,
survival_proficiency: false,
deception_proficiency: false,
intimidation_proficiency: false,
performance_proficiency: false,
persuasion_proficiency: false,
tool_proficiencies: nil,
weapon_proficiencies: "daggers, darts, slings, quarterstaffs, light crossbows",
armor_proficiencies: nil,
starting_equipment:"quarterstaff or dagger, component pouch or arcane focus, scholar's pack or explorer's pack, spellbook"
)

quarterstaff = Weapon.create!(
name: "Quarterstaff"
simple_weapon: true
melee_weapon: true
attack_range: 5
max_attack_range: 5
property: "Versatile (1d8)"
ammunition: nil
cost: 20
damage: "1d4"
damage_type: "bludgeoning"
weight: 4
equipped: false
description: "This weapon can be used with one or two hands. A damage value in parentheses appears with the property-the damage when the weapon is used with two hands to make a melee attack."
)

light_crossbow = Weapon.create!(
name: "Light Crossbow"
simple_weapon: true
melee_weapon: false
attack_range: 80
max_attack_range: 320
property: "Ammunition, Loading, Two-Handed"
ammunition: nil
cost: 2500
damage: "1d8"
damage_type: "piercing"
weight: 5
equipped: false
description: "You can use a weapon that has the ammunilion property to make a ranged attack only if you have ammunition to fire from the weapon. Each time you attack wilh the weapon, you expend one piece of ammunition. Drawing the ammunition from a quiver, case, or olher container is part of the atlack. At the end of the battle, you can recover half your expended ammunition by taking a minute to search the battlefield.
Because of the time required to load this weapon, you can fire only one piece of ammunition from it when you use an action, bonus action, or reaction to fire it, regardless of the number of attacks you can normally make."
)

greataxe = Weapon.create!(
name: "Greataxe"
simple_weapon: false
melee_weapon: true
attack_range: 5
max_attack_range: 5
property: "Heavy, Two-Handed"
ammunition: nil
cost: 3000
damage: "1d12"
damage_type: "slashing"
weight: 7
equipped: false
description: "Small creatures have disadvantage on attack rolls with heavy weapons. A heavy weapon's size and bulk make it too large for a Small creature to use effectively."
)

handaxe = Weapon.create!(
name: "Handaxe"
simple_weapon: true
melee_weapon: true
attack_range: 20
max_attack_range: 60
property: "Light, Thrown"
ammunition: nil
cost: 500
damage: "1d6"
damage_type: "slashing"
weight: 2
equipped: false
description: "A light weapon is small and easy to handle, making it ideal for use when fighting with two weapons.
If a weapon has the thrown property, you can throw the weapon to make a ranged attack. If the weapon is a melee weapon, you use the same ability modifier for that attack roll and damage roll that you would use for a melee attack with the weapon."
)

javelin = Weapon.create!(
name: "Javelin"
simple_weapon: true
melee_weapon: true
attack_range: 30
max_attack_range: 120
property: "Thrown"
ammunition: nil
cost: 50
damage: "1d6"
damage_type: "piercing"
weight: 2
equipped: false
description: "If a weapon has the thrown property, you can throw the weapon to make a ranged attack. If the weapon is a melee weapon, you use the same ability modifier for that attack roll and damage roll that you would use for a melee attack with the weapon."
)

puts "Seed finished"
#Race.each do |race|
#  puts "#{race.name} race created"
#end
#HeroClass.each do |race|
#  puts "#{hero_class.name} hero class created"
#end
puts "#{Race.count} races created"
puts "#{HeroClass.count} hero classes created"
puts "#{Weapon.count} weapons created"
