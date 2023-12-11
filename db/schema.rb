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

ActiveRecord::Schema.define(version: 2023_11_21_104213) do

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "start_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "diet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diet_id"], name: "index_comments_on_diet_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "diets", force: :cascade do |t|
    t.string "stretch"
    t.text "result"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.integer "user_id"
  end

  create_table "dislikes", force: :cascade do |t|
    t.integer "work_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_dislikes_on_user_id"
    t.index ["work_id"], name: "index_dislikes_on_work_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "diet_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diet_id"], name: "index_likes_on_diet_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "nocomments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "work_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_nocomments_on_user_id"
    t.index ["work_id"], name: "index_nocomments_on_work_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_tag_relations", force: :cascade do |t|
    t.integer "work_id", null: false
    t.integer "tag_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tag_id"], name: "index_work_tag_relations_on_tag_id"
    t.index ["work_id"], name: "index_work_tag_relations_on_work_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "exercise"
    t.string "menu"
    t.datetime "start_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo"
    t.integer "user_id"
  end

  add_foreign_key "comments", "diets"
  add_foreign_key "comments", "users"
  add_foreign_key "dislikes", "users"
  add_foreign_key "dislikes", "works"
  add_foreign_key "likes", "diets"
  add_foreign_key "likes", "users"
  add_foreign_key "nocomments", "users"
  add_foreign_key "nocomments", "works"
  add_foreign_key "work_tag_relations", "works"
end
