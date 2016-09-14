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

      t.timestamps
    end
  end
end
