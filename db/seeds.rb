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
armor_proficiencies: "light armor, medium armor, shields"
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
armor_proficiencies: nil
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
