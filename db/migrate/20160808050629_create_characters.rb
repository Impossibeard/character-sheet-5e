class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.belongs_to :race, index: true
      t.belongs_to :hero_class, index: true
      t.integer :level
      t.integer :current_xp
      t.integer :base_strength
      t.integer :base_dexterity
      t.integer :base_constitution
      t.integer :base_wisdom
      t.integer :base_intelligence
      t.integer :base_charisma
      t.integer :wealth
      t.integer :height
      t.integer :weight
      t.integer :vision
      t.integer :speed
      t.integer :current_hp
      t.integer :max_hp
      t.integer :temp_hp
      t.integer :proficiency_bonus

      t.timestamps
    end
  end
end
