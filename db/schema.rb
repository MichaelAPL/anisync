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

ActiveRecord::Schema.define(version: 2022_02_11_011558) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animes", force: :cascade do |t|
    t.integer "mal_id"
    t.integer "anilist_id"
    t.string "name"
    t.text "other_names"
    t.text "synopsis"
    t.string "studios"
    t.integer "aired_at_year"
    t.string "emmision_status"
    t.string "image_url"
    t.text "mal_raw"
    t.text "anilist_raw"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "mal_mean_score"
    t.float "anilist_mean_score"
    t.integer "total_episodes"
  end

  create_table "authentication_providers", force: :cascade do |t|
    t.string "provider_name"
    t.string "uid"
    t.string "user_name"
    t.string "access_token"
    t.string "refresh_token"
    t.boolean "is_primary"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "expires_at"
    t.index ["user_id"], name: "index_authentication_providers_on_user_id"
  end

  create_table "list_entries", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "anime_id"
    t.string "status"
    t.integer "episodes_seen"
    t.integer "score"
    t.date "started_at"
    t.date "finished_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anime_id"], name: "index_list_entries_on_anime_id"
    t.index ["user_id"], name: "index_list_entries_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
