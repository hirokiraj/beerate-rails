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
    t.string "name"
    t.string "brewery"
    t.string "country"
    t.integer "international_bitterness_unit"
    t.float "alcohol_by_volume"
    t.float "original_gravity"
    t.string "style"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "beer_id"
    t.text "aroma"
    t.text "look"
    t.text "taste"
    t.text "bitterness"
    t.text "mouthfeel"
    t.text "summary"
    t.integer "aroma_score"
    t.integer "look_score"
    t.integer "taste_score"
    t.integer "bitterness_score"
    t.integer "mouthfeel_score"
    t.integer "total_score"
    t.index ["beer_id"], name: "index_reviews_on_beer_id"
  end

  add_foreign_key "reviews", "beers"
end
