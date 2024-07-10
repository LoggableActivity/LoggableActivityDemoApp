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

ActiveRecord::Schema[7.1].define(version: 2024_07_09_090804) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "demo_addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "postal_code"
    t.bigint "demo_city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["demo_city_id"], name: "index_demo_addresses_on_demo_city_id"
  end

  create_table "demo_cities", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "demo_clubs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "demo_address_id"
  end

  create_table "demo_journals", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "state", default: 0
    t.bigint "patient_id"
    t.bigint "doctor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_demo_journals_on_doctor_id"
    t.index ["patient_id"], name: "index_demo_journals_on_patient_id"
  end

  create_table "demo_user_profiles", force: :cascade do |t|
    t.string "sex"
    t.string "religion"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_demo_user_profiles_on_user_id", unique: true
  end

  create_table "loggable_activity_activities", force: :cascade do |t|
    t.string "action"
    t.string "actor_type"
    t.bigint "actor_id"
    t.string "encrypted_actor_name"
    t.string "record_type"
    t.bigint "record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_type", "actor_id"], name: "index_loggable_activity_activities_on_actor"
    t.index ["record_type", "record_id"], name: "index_loggable_activity_activities_on_record"
  end

  create_table "loggable_activity_data_owners", force: :cascade do |t|
    t.string "record_type"
    t.bigint "record_id"
    t.bigint "encryption_key_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encryption_key_id"], name: "index_loggable_activity_data_owners_on_encryption_key_id"
    t.index ["record_type", "record_id"], name: "index_loggable_activity_data_owners_on_record"
  end

  create_table "loggable_activity_encryption_keys", force: :cascade do |t|
    t.string "record_type"
    t.bigint "record_id"
    t.string "secret_key"
    t.datetime "delete_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id"], name: "index_loggable_activity_encryption_keys_on_record"
  end

  create_table "loggable_activity_payloads", force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "encryption_key_id", null: false
    t.string "record_type"
    t.bigint "record_id"
    t.string "encrypted_record_name"
    t.json "encrypted_attrs"
    t.integer "related_to_activity_as", default: 0
    t.boolean "data_owner", default: false, null: false
    t.string "route"
    t.boolean "current_payload", default: true, null: false
    t.json "public_attrs", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_loggable_activity_payloads_on_activity_id"
    t.index ["encryption_key_id"], name: "index_loggable_activity_payloads_on_encryption_key_id"
    t.index ["record_type", "record_id"], name: "index_loggable_activity_payloads_on_record"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id"
    t.integer "demo_address_id"
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.text "bio"
    t.integer "user_type", default: 0
    t.integer "demo_club_id"
    t.index ["address_id"], name: "index_users_on_address_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "demo_addresses", "demo_cities"
  add_foreign_key "demo_clubs", "demo_addresses"
  add_foreign_key "demo_journals", "users", column: "doctor_id"
  add_foreign_key "demo_journals", "users", column: "patient_id"
  add_foreign_key "demo_user_profiles", "users"
  add_foreign_key "loggable_activity_data_owners", "loggable_activity_encryption_keys", column: "encryption_key_id"
  add_foreign_key "loggable_activity_payloads", "loggable_activity_activities", column: "activity_id"
  add_foreign_key "loggable_activity_payloads", "loggable_activity_encryption_keys", column: "encryption_key_id"
  add_foreign_key "users", "demo_addresses"
  add_foreign_key "users", "demo_addresses", column: "address_id"
  add_foreign_key "users", "demo_clubs"
end
