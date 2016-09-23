FactoryGirl.define do  factory :equipped_item do
    character nil
armor nil
  end

  factory :armor do
    name "MyString"
type ""
armor_base 1
strength_requirement 1
stealth_disadvantage false
cost 1
weight 1
description "MyText"
  end
  factory :weapon do
    name "MyString"
simple_weapon false
melee_weapon false
attack_range 1
max_attack_range 1
property "MyString"
ammunition 1
cost 1
damage "MyString"
damage_type "MyString"
weight 1
equipped false
description "MyText"
  end

  factory :race do
    name "Hill Dwarf"
    size 2
    speed 30
    vision 1
    strength_bonus 0
    dexterity_bonus 0
    constitution_bonus 2
    wisdom_bonus 1
    intelligence_bonus 0
    charisma_bonus 0
  end

  factory :hero_class do
    name "Barbarian"
    hit_dice 12
    strength_saving_throw_proficiency true
    dexterity_saving_throw_proficiency false
    constitution_saving_throw_proficiency true
    wisdom_saving_throw_proficiency false
    intelligence_saving_throw_proficiency false
    charisma_saving_throw_proficiency false
  end

  factory :character do
    sequence(:name) {|n| "Character #{n}"}
    race
    hero_class
    level 1
    current_xp 0
    strength 8
    dexterity 8
    constitution 8
    wisdom 8
    intelligence 8
    charisma 8
    wealth 0
    height 72
    weight 180
    speed 30
    current_hp 15
    max_hp 15
    temp_hp 0
    proficiency_bonus 2
  end
end
