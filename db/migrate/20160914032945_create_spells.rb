class CreateSpells < ActiveRecord::Migration[5.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.integer :level
      t.string :school
      t.string :casting_time
      t.integer :range
      t.boolean :range_touch
      t.boolean :range_self
      t.boolean :verbal
      t.boolean :somatic
      t.string :material
      t.integer :cost
      t.string :duration
      t.boolean :concentration
      t.string :roll
      t.string :save
      t.integer :save_success
      t.string :damage_type
      t.string :damage_increase
      t.text :description
      t.belongs_to :spellbook

      t.timestamps
    end
  end
end
