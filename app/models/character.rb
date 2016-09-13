class Character < ApplicationRecord

  SIMPLE_ATTRIBUTES = [:name, :level, :current_xp, :strength, :dexterity, :constitution, :wisdom,
                       :intelligence, :charisma, :wealth, :height, :weight, :vision, :speed,
                       :current_hp, :max_hp, :temp_hp, :proficiency_bonus]
  belongs_to :race
  belongs_to :hero_class

  enum vision: [:normal, :darkvision, :superior_darkvision, :truesight, :blind]

  #Deterines stat totals
  [:strength, :dexterity, :constitution, :wisdom, :intelligence, :charisma]. each do |ability|
    define_method ability do
      send("base_#{ability}") + race.send("#{ability}_bonus")
    end
  end

  #Determines ability modifiers for each stat
  def modifier(ability)
    ((ability.to_i / 2.1) - 5).round
  end

  #Handles saving throw checks
  [:strength_saving_throw, :dexterity_saving_throw, :constitution_saving_throw, :wisdom_saving_throw, :intelligence_saving_throw, :charisma_saving_throw].each do |method_name|
    define_method method_name do |arg|
      if hero_class.send("#{method_name}_proficiency") == true
        modifier(arg) + proficiency_bonus
      else
        modifer(arg)
      end
    end
  end
end
