require 'rails_helper'
require_relative '../../app/models/character'

RSpec.describe Character do
  it "returns the modified value of the Strength attribute" do
    expect (Character.strength_modifier).to eq(-1)
  end
end
