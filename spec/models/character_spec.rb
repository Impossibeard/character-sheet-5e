require 'rails_helper'
require_relative '../../app/models/character'

RSpec.describe Character do
  character = Character.new(base_strength: 8, race_id: 1)

  it "returns the modified value of the Strength attribute" do
    expect (character.strength_modifier).to eq(-1)
  end
end
