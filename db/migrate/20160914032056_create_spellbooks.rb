class CreateSpellbooks < ActiveRecord::Migration[5.0]
  def change
    create_table :spellbooks do |t|
      t.boolean :ritual_casting
      t.boolean :short_rest_regen
      t.belongs_to :hero_class

      t.timestamps
    end
  end
end
