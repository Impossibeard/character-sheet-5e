class Character < ApplicationRecord

  SIMPLE_ATTRIBUTES = [:name, :level, :current_xp, :strength, :dexterity, :constitution,
                       :intelligence, :wisdom, :charisma, :wealth, :height, :weight, :vision, :speed,
                       :current_hp, :max_hp, :temp_hp, :proficiency_bonus]
  belongs_to :race
  belongs_to :hero_class
  has_many :equipped_items
  has_many :armors, :through => :equipped_items

  enum vision: [:normal, :darkvision, :superior_darkvision, :truesight, :blind]

  def armor_class
    if armors.blank?
      ac = 10 + modifier(dexterity)
    else
      armors.each do |armor|
        ac += armor.armor_base(modifier(dexterity))
      end
    end
  end

  def hit_points
    dice_amount, dice_faces = hero_class.hit_dice.split("d")
    starting_hp = dice_faces.to_i + modifier(constitution)
    leveled_hp = ((dice_faces.to_i/2)+ 1 + modifier(constitution)) * (hero_class.level - 1)
    @max_hp = starting_hp + leveled_hp
  end

  #Deterines stat totals
  [:strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma]. each do |ability|
    define_method ability do
      send("base_#{ability}") + race.send("#{ability}_bonus")
    end
  end

  #Determines ability modifiers for each stat
  def modifier(ability)
    ((ability.to_i / 2.1) - 5).round
  end

  #Deterines stat totals
  [:strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma]. each do |ability|
    define_method ability do
      send("base_#{ability}") + race.send("#{ability}_bonus")
    end
  end

  #Deterines Strength skills
  [:athletics, :strength_saving_throw]. each do |skill|
    define_method skill do
      if hero_class.send("#{skill}_proficiency")
        modifier(strength) + proficiency_bonus
      else
        modifier(strength)
      end
    end
  end

  #Deterines Dexterity skills
  [:acrobatics, :sleight_of_hand, :stealth, :dexterity_saving_throw]. each do |skill|
    define_method skill do
      if hero_class.send("#{skill}_proficiency")
        modifier(dexterity) + proficiency_bonus
      else
        modifier(dexterity)
      end
    end
  end

  #Deterines Constitution skills
  def constitution_saving_throw
    if hero_class.constitution_saving_throw_proficiency
      modifier(constitution) + proficiency_bonus
    else
      modifier(constitution)
    end
  end

  #Deterines Intelligence skills
  [:arcana, :history, :investigation, :nature, :religion, :intelligence_saving_throw]. each do |skill|
    define_method skill do
      if hero_class.send("#{skill}_proficiency")
        modifier(intelligence) + proficiency_bonus
      else
        modifier(intelligence)
      end
    end
  end

  #Deterines Wisdom skills
  [:animal_handling, :insight, :medicine, :perception, :survival, :wisdom_saving_throw]. each do |skill|
    define_method skill do
      if hero_class.send("#{skill}_proficiency")
        modifier(wisdom) + proficiency_bonus
      else
        modifier(wisdom)
      end
    end
  end

  #Deterines Charisma skills
  [:deception, :intimidation, :performance, :persuasion, :charisma_saving_throw]. each do |skill|
    define_method skill do
      if hero_class.send("#{skill}_proficiency")
        modifier(charisma) + proficiency_bonus
      else
        modifier(charisma)
      end
    end
  end

  def spell_attack_mod(caster)
    spellcasting_ability = case caster
    when "Arcane Trickster", "Eldritch Knight", "Wizard"
      intelligence
    when "Cleric", "Druid", "Monk", "Ranger"
      wisdom
    when "Bard", "Paladin", "Sorcerer", "Warlock"
      charisma
    #Deals with spells given directly from the character
    when "Strength", "Constitution", "Dexterity", "Intelligence", "Wisdom", "Charisma"
      send(caster.downcase)
    else
      nil
    end
    proficiency_bonus + modifier(spellcasting_ability) if spellcasting_ability
  end

  def spell_save_dc(caster)
    8 + spell_attack_mod(caster)
  end

  def vision
    race.vision
  end

  def proficiency_bonus
    hero_class.proficiency_bonus
  end

  def tool_proficiencies
    unless hero_class.tool_proficiencies == nil
      hero_class.tool_proficiencies.split(",").map(&:lstrip)
    end
  end

  def weapon_proficiencies
    unless hero_class.weapon_proficiencies == nil
      hero_class.weapon_proficiencies.split(",").map(&:lstrip)
    end
  end

  def armor_proficiencies
    unless hero_class.armor_proficiencies == nil
      hero_class.armor_proficiencies.split(",").map(&:lstrip)
    end
  end

  def inventory
    inventory = []
    hero_class.starting_equipment.split(",").map(&:lstrip).each do |x|
      inventory << x
    end
  end
end
