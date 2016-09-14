# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160914032945) do

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.integer  "race_id"
    t.integer  "hero_class_id"
    t.integer  "level"
    t.integer  "current_xp"
    t.integer  "base_strength"
    t.integer  "base_dexterity"
    t.integer  "base_constitution"
    t.integer  "base_wisdom"
    t.integer  "base_intelligence"
    t.integer  "base_charisma"
    t.integer  "wealth"
    t.integer  "height"
    t.integer  "weight"
    t.integer  "vision"
    t.integer  "speed"
    t.integer  "current_hp"
    t.integer  "max_hp"
    t.integer  "temp_hp"
    t.integer  "proficiency_bonus"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["hero_class_id"], name: "index_characters_on_hero_class_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
  end

  create_table "hero_classes", force: :cascade do |t|
    t.string   "name"
    t.integer  "level"
    t.string   "hit_dice"
    t.boolean  "strength_saving_throw_proficiency"
    t.boolean  "dexterity_saving_throw_proficiency"
    t.boolean  "constitution_saving_throw_proficiency"
    t.boolean  "wisdom_saving_throw_proficiency"
    t.boolean  "intelligence_saving_throw_proficiency"
    t.boolean  "charisma_saving_throw_proficiency"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "races", force: :cascade do |t|
    t.string   "name"
    t.string   "size"
    t.integer  "speed"
    t.integer  "vision"
    t.integer  "strength_bonus"
    t.integer  "dexterity_bonus"
    t.integer  "constitution_bonus"
    t.integer  "wisdom_bonus"
    t.integer  "intelligence_bonus"
    t.integer  "charisma_bonus"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "spellbooks", force: :cascade do |t|
    t.string   "max_spell_slots"
    t.string   "integer"
    t.integer  "available_spell_slots"
    t.integer  "max_sorcery_points"
    t.integer  "available_sorcerer_points"
    t.integer  "spell_save_dc"
    t.integer  "spell_attack_mod"
    t.boolean  "ritual_casting"
    t.boolean  "spell_regen_time"
    t.integer  "cantrips"
    t.integer  "character_id"
    t.integer  "hero_class_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["character_id"], name: "index_spellbooks_on_character_id"
    t.index ["hero_class_id"], name: "index_spellbooks_on_hero_class_id"
  end

  create_table "spells", force: :cascade do |t|
    t.string   "name"
    t.integer  "level"
    t.string   "school"
    t.string   "casting_time"
    t.integer  "range"
    t.boolean  "range_touch"
    t.boolean  "range_self"
    t.boolean  "verbal"
    t.boolean  "somatic"
    t.string   "material"
    t.integer  "cost"
    t.string   "duration"
    t.boolean  "concentration"
    t.string   "roll"
    t.string   "damage_type"
    t.string   "spellcasting_ability"
    t.text     "description"
    t.integer  "spellbook_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["spellbook_id"], name: "index_spells_on_spellbook_id"
  end

end
