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

end
