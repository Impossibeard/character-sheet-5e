require 'rails_helper'
require_relative '../../app/models/character'

RSpec.describe Character do
  before(:example) do
    hero_class = HeroClass.create(strength_saving_throw_proficiency: true)
    race = Race.create(strength_bonus: 0, constitution_bonus: 2, wisdom_bonus: 1)
    @character = Character.create(base_strength: 8, race_id: race.id, hero_class_id: hero_class.id, proficiency_bonus: 2)
  end


  it "returns the modified value of the Strength attribute" do
    expect(@character.modifier(@character.strength)).to eq(-1)
  end

  it "checks if character is proficient with a saving throw" do
    expect(@character.hero_class.strength_saving_throw_proficiency).to eq(true)
  end

  it "calculates saving throw modifier for strength" do
    expect(@character.strength_saving_throw(@character.strength)).to eq(1)
  end

  it "calculates spell save dc for Clerics" do
    cleric = HeroClass.create(name:"Cleric", level:1, hit_dice:"1d10", wisdom_saving_throw_proficiency:true, charisma_saving_throw_proficiency:true)
    race = Race.create(wisdom_bonus:1)
    adventurer = Character.create(base_wisdom:12, hero_class_id:cleric.id, race_id:race.id, proficiency_bonus:2)

    expect(adventurer.spell_save_dc).to eq(11)
  end

  it "calculates spell save dc for Sorcerers" do
    sorcerer = HeroClass.create(name:"Sorcerer", level:1, hit_dice:"1d8", constitution_saving_throw_proficiency:true, charisma_saving_throw_proficiency:true)
    race = Race.create(charisma_bonus:2)
    adventurer = Character.create(base_charisma:14, hero_class_id:sorcerer.id, race_id:race.id, proficiency_bonus:2)

    expect(adventurer.spell_save_dc).to eq(13)
  end

end
