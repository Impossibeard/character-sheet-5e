class Spellbook < ApplicationRecord
  attr_accessor :cantrip, :first_level, :second_level, :third_level, :fourth_level, :fifth_level, :sixth_level, :seventh_level, :eighth_level, :nineth_level

  belongs_to :hero_class

  def cantrips(hero_class)
    if hero_class.level >= 10
      5
    elsif hero_class.level >= 4
      4
    else
      3
    end
  end

  def first_level_spell_slots
    if hero_class.level >= 3
      4
    elsif hero_class.level >= 2
      3
    else
      2
    end
  end

  def known_spells
    cantrip = cantrips
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
    first_level = first_level_spell_slots
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
