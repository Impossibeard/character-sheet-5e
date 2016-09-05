# the below is only needed if rails is needed
# require 'rails_helper'
require_relative '../../app/models/dice'

RSpec.describe Dice do
  context ".from_string" do
    it "returns a Dice object" do
      expect(Dice.from_string("4d6")).to be_instance_of(Dice)
    end

    it "returns a correct total" do
      fake_random_number_function = ->(n) { 1 }
      expect(Dice.from_string("4d6+1", random_number_generator: fake_random_number_function).total).to eq(5)
    end
  end

  context "new" do
    let!(:dice) do
      counter = 0
      fake_random_number_function = ->(n) { counter += 1 }
      # Instead of a random number each dice roll is incremented by 1
      Dice.new(random_number_generator: fake_random_number_function)
    end

    it "#roll" do
      expect(dice.roll(2, d: 6).total).to eq(3)
    end

    it "#plus" do
      expect(dice.roll(2, d: 6).plus(6).total).to eq(9)
    end

    it "#double_dice" do
      expect(dice.roll(2, d: 6).plus(6).double_dice.total).to eq(12)
    end

    it "#lowest" do
      expect(dice.roll(4, d: 6).lowest(3)).to eq([1,2,3])
    end

    it "#highest" do
      expect(dice.roll(4, d: 6).highest(3)).to eq([4,3,2])
    end
  end
end