class CreateWeapons < ActiveRecord::Migration[5.0]
  def change
    create_table :weapons do |t|
      t.string :name
      t.boolean :simple_weapon
      t.boolean :melee_weapon
      t.integer :attack_range
      t.integer :max_attack_range
      t.string :property
      t.integer :ammunition
      t.integer :cost
      t.string :damage
      t.string :damage_type
      t.integer :weight
      t.boolean :equipped
      t.text :description

      t.timestamps
    end
  end
end
