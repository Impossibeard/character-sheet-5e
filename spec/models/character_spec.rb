require 'rails_helper'
require_relative '../../app/models/character'

RSpec.describe Character do

  race = Race.create(strength_bonus: 0, constitution_bonus: 2, wisdom_bonus: 1)
  character = Character.create(base_strength: 8, race_id: race.id)

  it "returns the modified value of the Strength attribute" do
    expect(character.strength_modifier).to eq(-1)
  end
end
