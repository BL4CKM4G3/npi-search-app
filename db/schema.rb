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

ActiveRecord::Schema[7.0].define(version: 2022_08_14_142631) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "country_code"
    t.string "country_name"
    t.string "city"
    t.string "address_purpose"
    t.string "address_type"
    t.string "address_1"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "provider_cache_id"
    t.index ["provider_cache_id"], name: "index_addresses_on_provider_cache_id"
  end

  create_table "provider_caches", force: :cascade do |t|
    t.string "npi_number"
    t.string "name"
    t.string "status"
    t.integer "enumeration_type"
    t.string "credential"
    t.datetime "last_updated"
    t.datetime "registered_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxonomies", force: :cascade do |t|
    t.string "code"
    t.string "desc"
    t.boolean "primary"
    t.string "state"
    t.string "license"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "provider_cache_id"
    t.index ["provider_cache_id"], name: "index_taxonomies_on_provider_cache_id"
  end

end
