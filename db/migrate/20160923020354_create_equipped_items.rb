class CreateEquippedItems < ActiveRecord::Migration[5.0]
  def change
    create_table :equipped_items do |t|
      t.belongs_to :character, foreign_key: true
      t.belongs_to :armor, foreign_key: true

      t.timestamps
    end
  end
end
