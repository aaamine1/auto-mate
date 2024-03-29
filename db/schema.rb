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

ActiveRecord::Schema.define(version: 2022_03_09_093809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.string "status", default: "pending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "vending_machine_id", null: false
    t.date "date_completed", default: "2022-01-04"
    t.index ["user_id"], name: "index_bookings_on_user_id"
    t.index ["vending_machine_id"], name: "index_bookings_on_vending_machine_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "list_price"
    t.integer "margin"
    t.integer "capacity"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "vending_machine_id", null: false
    t.bigint "product_id", null: false
    t.index ["product_id"], name: "index_items_on_product_id"
    t.index ["vending_machine_id"], name: "index_items_on_vending_machine_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url", default: "https://lorempixel.com/730/411"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_type"
    t.string "iban"
    t.string "first_name"
    t.string "last_name"
    t.string "avatar_url", default: "default_avatar.jpg"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vending_machines", force: :cascade do |t|
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.text "description"
    t.string "name"
    t.index ["user_id"], name: "index_vending_machines_on_user_id"
  end

  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "vending_machines"
  add_foreign_key "items", "products"
  add_foreign_key "items", "vending_machines"
  add_foreign_key "vending_machines", "users"
end
