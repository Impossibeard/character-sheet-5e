class Character < ApplicationRecord
  SIMPLE_ATTRIBUTES = [:name, :level, :current_xp, :strength, :dexterity, :constitution, :wisdom,
                       :intelligence, :charisma, :wealth, :height, :weight, :vision, :speed,
                       :current_hp, :max_hp, :temp_hp, :proficiency_bonus]
  belongs_to :race
  belongs_to :hero_class

  enum vision: [:normal, :darkvision, :superior_darkvision, :truesight, :blind]


  #def total_strength
    #total_modifications = 0

    ## model (db) + race modifier + any effect sum
    #self.strength + self.race.strength_bonus + total_modifications
  #end

end

#
# character = Character.new(id)


# /character/1
# { name: "whatever", strength: 50 }

 # /character/1/add_effect/5
 # /character/character_id/add_effect/effect_id
 # { name: "Whatever", strength: 50 }
