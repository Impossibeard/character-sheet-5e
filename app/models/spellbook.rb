class Spellbook < ApplicationRecord
  attr_accessor :cantrip, :first_level, :second_level, :third_level, :fourth_level, :fifth_level, :sixth_level, :seventh_level, :eighth_level, :nineth_level

  def known_spells
    cantrip = 3
    first_level = 6
    second_level = 0
    third_level = 0
    fourth_level = 0
    fifth_level = 0
    sixth_level = 0
    seventh_level = 0
    eighth_level = 0
    nineth_level = 0
  end

  def spell_slots
    first_level = 6
    second_level = 0
    third_level = 0
    fourth_level = 0
    fifth_level = 0
    sixth_level = 0
    seventh_level = 0
    eighth_level = 0
    nineth_level = 0
  end

  def prepared(character)
    character.hero_class.level + character.modifier(intelligence)
  end


end
