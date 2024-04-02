# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_29_230652) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cloths", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "cost"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_cloths_on_location_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "f_name"
    t.string "l_name"
    t.string "email"
    t.string "password_digest"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers_locations", id: false, force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customers_locations_on_customer_id"
    t.index ["location_id"], name: "index_customers_locations_on_location_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string "comment"
    t.string "created_by"
    t.bigint "cloth_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cloth_id"], name: "index_feedbacks_on_cloth_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "area"
    t.string "city"
    t.string "province"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cloths", "locations"
  add_foreign_key "customers_locations", "customers"
  add_foreign_key "customers_locations", "locations"
  add_foreign_key "feedbacks", "cloths"
end
