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

ActiveRecord::Schema.define(version: 20170611173327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: :cascade do |t|
    t.string "name", null: false
    t.string "brewery", null: false
    t.string "country"
    t.integer "international_bitterness_unit"
    t.float "alcohol_by_volume"
    t.float "final_gravity"
    t.float "original_gravity"
    t.string "style", null: false
    t.string "malts", default: ""
    t.string "yeasts", default: ""
    t.string "hops", default: ""
    t.string "special_ingredients", default: ""
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "beer_id"
    t.text "aroma"
    t.text "appearance"
    t.text "flavor"
    t.text "mouthfeel"
    t.text "overall"
    t.integer "aroma_score", null: false
    t.integer "appearance_score", null: false
    t.integer "flavor_score", null: false
    t.integer "mouthfeel_score", null: false
    t.integer "overall_score", null: false
    t.integer "total_score", null: false
    t.integer "stylistic_accuracy", null: false
    t.integer "technical_merit", null: false
    t.integer "intangibles", null: false
    t.boolean "acetaldehyde"
    t.boolean "alcoholic"
    t.boolean "astringent"
    t.boolean "diacetyl"
    t.boolean "dms"
    t.boolean "estery"
    t.boolean "grassy"
    t.boolean "light_struck"
    t.boolean "metallic"
    t.boolean "musty"
    t.boolean "oxidized"
    t.boolean "phenolic"
    t.boolean "solvent"
    t.boolean "sour_acidic"
    t.boolean "sulfur"
    t.boolean "vegetal"
    t.boolean "yeasty"
    t.index ["beer_id"], name: "index_reviews_on_beer_id"
  end

  add_foreign_key "reviews", "beers"
end
