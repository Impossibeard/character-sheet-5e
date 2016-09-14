class CreateSpellbooks < ActiveRecord::Migration[5.0]
  def change
    create_table :spellbooks do |t|
      t.string :max_spell_slots
      t.string :integer
      t.integer :available_spell_slots
      t.integer :max_sorcery_points
      t.integer :available_sorcerer_points
      t.integer :spell_save_dc
      t.integer :spell_attack_mod
      t.boolean :ritual_casting
      t.boolean :spell_regen_time
      t.integer :cantrips
      t.belongs_to :character

      t.timestamps
    end
  end
end
