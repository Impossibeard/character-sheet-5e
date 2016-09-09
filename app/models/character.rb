class Character < ApplicationRecord
  SIMPLE_ATTRIBUTES = [:name, :level, :current_xp, :strength, :dexterity, :constitution, :wisdom,
                       :intelligence, :charisma, :wealth, :height, :weight, :vision, :speed,
                       :current_hp, :max_hp, :temp_hp, :proficiency_bonus]
  belongs_to :race
  belongs_to :hero_class

  enum vision: [:normal, :darkvision, :superior_darkvision, :truesight, :blind]

  def strength
    base_strength
  end

  def constitution
    base_constitution + self.race.constitution_bonus
  end

  def dexterity
    base_dexterity
  end

  def wisdom
    base_wisdom
  end

  def intelligence
    base_intelligence
  end

  def charisma
    base_charisma
  end
end
