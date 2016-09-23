require 'rails_helper'
require_relative '../../app/models/character'

RSpec.describe Character do
  before(:example) do
    wizard = HeroClass.create(name: "Wizard", level: 1, hit_dice: "1d6", strength_saving_throw_proficiency: false, dexterity_saving_throw_proficiency: false, constitution_saving_throw_proficiency: false, wisdom_saving_throw_proficiency: true, intelligence_saving_throw_proficiency: true, charisma_saving_throw_proficiency: false)
    wizard = HeroClass.create(name: "Wizard", level: 1, hit_dice: "1d6", strength_saving_throw_proficiency: false, dexterity_saving_throw_proficiency: false, constitution_saving_throw_proficiency: false, wisdom_saving_throw_proficiency: true, intelligence_saving_throw_proficiency: true, charisma_saving_throw_proficiency: false)
    tiefling = Race.create(name: "Tiefling", strength_bonus: 0, constitution_bonus: 0, dexterity_bonus: 0, wisdom_bonus: 0, intelligence_bonus: 1, charisma_bonus: 2, vision: 1)
    @tiefling_wizard = Character.create(base_strength: 8, base_constitution: 10, base_dexterity: 10, base_wisdom: 10, base_intelligence: 15, base_charisma: 12, race_id: tiefling.id, hero_class_id: wizard.id)
    shield = Armor.create(name: "Shield", armor_type: "Shield", armor_base: 2, strength_requirement: nil, stealth_disadvantage: false, cost: 1000, weight: 6, description: nil
    )
    padded_armor = Armor.create(name: "Padded", armor_type: "Light", armor_base: 11, strength_requirement: nil, stealth_disadvantage: true, cost: 500, weight: 8, description: "Padded armor consists of quilted layers of cloth and batting."
    )
    @tiefling_wizard.equipped_items.create(armor_id:padded_armor.id)
    @tiefling_wizard.equipped_items.create(armor_id:shield.id)
    wizard_spellbook = Spellbook.create(ritual_casting: true, short_rest_regen: false)
    burning_hands = Spell.create(name: "Burning Hands", level: 1, school: "Evocation", casting_time: "action", range: "Self (15 foot cone)", range_touch: false, range_self: true, verbal: true, somatic: true, material: nil, cost: nil, duration: "Instantaneous", concentration: false, roll: "3d6", save_check: "Dexterity", save_success: 0.5, damage_type: "fire", damage_increase: "1d6 per level", description: "As you hold your hands with thumbs touching and fingers spread, a thin sheet of flames shoots forth from your outstretched fingertips. Each creature in a 15-foot cone must make a Dexterity saving throw. A creature takes 3d6 fire damage on a failed save, or half as much damage on a successful one. The fire ignites any flammable objects in the area that aren’t being worn or carried.")
  end


  it "returns the modified value of the Strength attribute" do
    expect(@tiefling_wizard.modifier(@tiefling_wizard.strength)).to eq(-1)
  end

  it "returns the modified value of the Constitution attribute" do
    expect(@tiefling_wizard.modifier(@tiefling_wizard.constitution)).to eq(0)
  end

  it "returns the modified value of the Dexterity attribute" do
    expect(@tiefling_wizard.modifier(@tiefling_wizard.dexterity)).to eq(0)
  end

  it "returns the modified value of the Intelligence attribute" do
    expect(@tiefling_wizard.modifier(@tiefling_wizard.intelligence)).to eq(3)
  end

  it "returns the modified value of the Wisdom attribute" do
    expect(@tiefling_wizard.modifier(@tiefling_wizard.wisdom)).to eq(0)
  end

  it "returns the modified value of the Charisma attribute" do
    expect(@tiefling_wizard.modifier(@tiefling_wizard.charisma)).to eq(2)
  end

  it "checks if character is proficient with a Strength saving throw" do
    expect(@tiefling_wizard.hero_class.strength_saving_throw_proficiency).to eq(false)
  end

  it "checks if character is proficient with a Constitution saving throw" do
    expect(@tiefling_wizard.hero_class.constitution_saving_throw_proficiency).to eq(false)
  end

  it "checks if character is proficient with a Dexterity saving throw" do
    expect(@tiefling_wizard.hero_class.dexterity_saving_throw_proficiency).to eq(false)
  end

  it "checks if character is proficient with a Intelligence saving throw" do
    expect(@tiefling_wizard.hero_class.intelligence_saving_throw_proficiency).to eq(true)
  end

  it "checks if character is proficient with a Wisdom saving throw" do
    expect(@tiefling_wizard.hero_class.wisdom_saving_throw_proficiency).to eq(true)
  end

  it "checks if character is proficient with a Charisma saving throw" do
    expect(@tiefling_wizard.hero_class.charisma_saving_throw_proficiency).to eq(false)
  end

  it "calculates saving throw modifier for Strength" do
    expect(@tiefling_wizard.strength_saving_throw).to eq(-1)
  end

  it "calculates saving throw modifier for Constitution" do
    expect(@tiefling_wizard.constitution_saving_throw).to eq(0)
  end

  it "calculates saving throw modifier for Dexterity" do
    expect(@tiefling_wizard.dexterity_saving_throw).to eq(0)
  end

  it "calculates saving throw modifier for Intelligence" do
    expect(@tiefling_wizard.intelligence_saving_throw).to eq(5)
  end

  it "calculates saving throw modifier for Wisdom" do
    expect(@tiefling_wizard.wisdom_saving_throw).to eq(2)
  end

  it "calculates saving throw modifier for Charisma" do
    expect(@tiefling_wizard.charisma_saving_throw).to eq(2)
  end

  it "calculates spell attack bonus for wizards" do
    expect(@tiefling_wizard.spell_attack_mod(@tiefling_wizard.hero_class.name)).to eq(5)
  end

  it "calculates spell save dc for wizards" do
    expect(@tiefling_wizard.spell_save_dc(@tiefling_wizard.hero_class.name)).to eq(13)
  end

  it "calculates characters total hit points at level 1" do
    expect(@tiefling_wizard.hit_points).to eq(6)
  end

  it "calculates characters total hit points at level 2" do
    @tiefling_wizard.hero_class.level += 1
    expect(@tiefling_wizard.hit_points).to eq(10)
  end

  it "calculates a skill modifier" do
    expect(@tiefling_wizard.acrobatics).to eq(0)
  end

  it "checks that all armor is accounted for" do
    expect(Armor.all.count).to eq(2)
  end

  it "checks to see if armor is being equipped" do
    expect(@tiefling_wizard.armors.count).to eq(2)
  end

  it "calculates armor class" do
    expect(@tiefling_wizard.armor_class).to eq(13)
  end

end
