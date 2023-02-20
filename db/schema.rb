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

ActiveRecord::Schema[7.0].define(version: 2023_01_04_225132) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cheers", force: :cascade do |t|
    t.integer "giver_id", null: false
    t.integer "goal_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["giver_id"], name: "index_cheers_on_giver_id"
    t.index ["goal_id", "giver_id"], name: "index_cheers_on_goal_id_and_giver_id", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.string "body", null: false
    t.integer "author_id", null: false
    t.integer "commentable_id", null: false
    t.string "commentable_type", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["commentable_id"], name: "index_comments_on_commentable_id"
  end

  create_table "goals", force: :cascade do |t|
    t.boolean "private", default: false, null: false
    t.boolean "completed", default: false, null: false
    t.integer "user_id", null: false
    t.string "title", null: false
    t.text "details"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["title"], name: "index_goals_on_title"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "session_token", null: false
    t.string "password_digest", null: false
    t.integer "cheer_count", default: 0, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
