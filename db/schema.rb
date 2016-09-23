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

ActiveRecord::Schema.define(version: 20160923020354) do

  create_table "armors", force: :cascade do |t|
    t.string   "name"
    t.string   "armor_type"
    t.integer  "armor_base"
    t.integer  "strength_requirement"
    t.boolean  "stealth_disadvantage"
    t.integer  "cost"
    t.integer  "weight"
    t.text     "description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

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
    t.integer  "speed"
    t.integer  "current_hp"
    t.integer  "max_hp"
    t.integer  "temp_hp"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["hero_class_id"], name: "index_characters_on_hero_class_id"
    t.index ["race_id"], name: "index_characters_on_race_id"
  end

  create_table "equipped_items", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "armor_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["armor_id"], name: "index_equipped_items_on_armor_id"
    t.index ["character_id"], name: "index_equipped_items_on_character_id"
  end

  create_table "hero_classes", force: :cascade do |t|
    t.string   "name"
    t.integer  "level",                                 default: 1
    t.string   "hit_dice"
    t.boolean  "strength_saving_throw_proficiency"
    t.boolean  "dexterity_saving_throw_proficiency"
    t.boolean  "constitution_saving_throw_proficiency"
    t.boolean  "wisdom_saving_throw_proficiency"
    t.boolean  "intelligence_saving_throw_proficiency"
    t.boolean  "charisma_saving_throw_proficiency"
    t.boolean  "athletics_proficiency"
    t.boolean  "acrobatics_proficiency"
    t.boolean  "sleight_of_hand_proficiency"
    t.boolean  "stealth_proficiency"
    t.boolean  "arcana_proficiency"
    t.boolean  "history_proficiency"
    t.boolean  "investigation_proficiency"
    t.boolean  "nature_proficiency"
    t.boolean  "religion_proficiency"
    t.boolean  "animal_handling_proficiency"
    t.boolean  "insight_proficiency"
    t.boolean  "medicine_proficiency"
    t.boolean  "perception_proficiency"
    t.boolean  "survival_proficiency"
    t.boolean  "deception_proficiency"
    t.boolean  "intimidation_proficiency"
    t.boolean  "performance_proficiency"
    t.boolean  "persuasion_proficiency"
    t.string   "tool_proficiencies"
    t.string   "weapon_proficiencies"
    t.string   "armor_proficiencies"
    t.string   "starting_equipment"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
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
    t.string   "languages"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "spellbooks", force: :cascade do |t|
    t.boolean  "ritual_casting"
    t.boolean  "short_rest_regen"
    t.integer  "hero_class_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
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
    t.string   "save_check"
    t.integer  "save_success"
    t.string   "damage_type"
    t.string   "damage_increase"
    t.text     "description"
    t.integer  "spellbook_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["spellbook_id"], name: "index_spells_on_spellbook_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string   "name"
    t.boolean  "simple_weapon"
    t.boolean  "melee_weapon"
    t.integer  "attack_range"
    t.integer  "max_attack_range"
    t.string   "property"
    t.integer  "ammunition"
    t.integer  "cost"
    t.string   "damage"
    t.string   "damage_type"
    t.integer  "weight"
    t.boolean  "equipped"
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
