class CreateArmors < ActiveRecord::Migration[5.0]
  def change
    create_table :armors do |t|
      t.string :name
      t.string :armor_type
      t.integer :armor_base
      t.integer :strength_requirement
      t.boolean :stealth_disadvantage
      t.integer :cost
      t.integer :weight
      t.text :description
      t.belongs_to :character

      t.timestamps
    end
  end
end
