class Character < ApplicationRecord

  SIMPLE_ATTRIBUTES = [:name, :level, :current_xp, :strength, :dexterity, :constitution, :wisdom,
                       :intelligence, :charisma, :wealth, :height, :weight, :vision, :speed,
                       :current_hp, :max_hp, :temp_hp, :proficiency_bonus]
  belongs_to :race
  belongs_to :hero_class

  enum vision: [:normal, :darkvision, :superior_darkvision, :truesight, :blind]

  def hit_points
    dice_amount, dice_faces = hero_class.hit_dice.split("d")
    starting_hp = dice_faces.to_i + modifier(constitution)
    leveled_hp = ((dice_faces.to_i/2)+ 1 + modifier(constitution)) * (hero_class.level - 1)
    @max_hp = starting_hp + leveled_hp
  end

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
        modifier(arg)
      end
    end
  end

  def spell_attack_mod(spellcasting_ability)
    modifier_value = case spellcasting_ability
    when "Cleric", "Druid", "Monk", "Ranger"
      wisdom
    when "Arcane Trickster", "Eldritch Knight", "Wizard"
      intelligence
    when "Bard", "Paladin", "Sorcerer", "Warlock"
      charisma
    when "Strength"
      strength
    #Deals with spells given directly from the character
    when "Strength", "Constitution", "Dexterity", "Wisdom", "Intelligence", "Charisma"
      send(spellcasting_ability.downcase)
    else
      nil
    end

    proficiency_bonus + modifier(modifier_value) if modifier_value
  end

  def spell_save_dc(spellcasting_ability)
    8 + spell_attack_mod(spellcasting_ability)
  end

  def vision
    race.vision
  end
end
