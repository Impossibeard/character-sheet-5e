class CreateHeroClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :hero_classes do |t|
      t.string :name
      t.integer :level
      t.string :hit_dice
      t.boolean :strength_saving_throw_proficiency
      t.boolean :dexterity_saving_throw_proficiency
      t.boolean :constitution_saving_throw_proficiency
      t.boolean :wisdom_saving_throw_proficiency
      t.boolean :intelligence_saving_throw_proficiency
      t.boolean :charisma_saving_throw_proficiency
      t.boolean :athletics_proficiency
      t.boolean :acrobatics_proficiency
      t.boolean :sleight_of_hand_proficiency
      t.boolean :stealth_proficiency
      t.boolean :arcana_proficiency
      t.boolean :history_proficiency
      t.boolean :investigation_proficiency
      t.boolean :nature_proficiency
      t.boolean :religion_proficiency
      t.boolean :animal_handling_proficiency
      t.boolean :insight_proficiency
      t.boolean :medicine_proficiency
      t.boolean :perception_proficiency
      t.boolean :survival_proficiency
      t.boolean :deception_proficiency
      t.boolean :intimidation_proficiency
      t.boolean :performance_proficiency
      t.boolean :persuasion_proficiency
      t.string :tool_proficiencies
      t.string :weapon_proficiencies
      t.string :armor_proficiencies
      t.string :starting_equipment
      t.timestamps
    end
  end
end
