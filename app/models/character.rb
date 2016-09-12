class Character < ApplicationRecord

  SIMPLE_ATTRIBUTES = [:name, :level, :current_xp, :strength, :dexterity, :constitution, :wisdom,
                       :intelligence, :charisma, :wealth, :height, :weight, :vision, :speed,
                       :current_hp, :max_hp, :temp_hp, :proficiency_bonus]
  belongs_to :race
  belongs_to :hero_class

  enum vision: [:normal, :darkvision, :superior_darkvision, :truesight, :blind]

  def strength
    self.base_strength + self.race.strength_bonus
  end

  def constitution
    self.base_constitution + self.race.constitution_bonus
  end

  def dexterity
    self.base_dexterity + self.race.dexterity_bonus
  end

  def wisdom
    self.base_wisdom + self.race.wisdom_bonus
  end

  def intelligence
    self.base_intelligence + self.race.intelligence_bonus
  end

  def charisma
    self.base_charisma + self.race.charisma_bonus
  end

  def modifier(ability)
    ((ability.to_i / 2.1) - 5).round
  end

end
