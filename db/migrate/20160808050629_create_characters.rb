class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :level
      t.integer :current_xp
      t.integer :strength
      t.integer :dexterity
      t.integer :constitution
      t.integer :wisdom
      t.integer :intelligence
      t.integer :charisma
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
