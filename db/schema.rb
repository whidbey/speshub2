# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140522132719) do

  create_table "atmospheres", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "commenter"
    t.integer  "space_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["space_id"], name: "index_comments_on_space_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "detaileds", force: true do |t|
    t.string   "content"
    t.string   "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "detaileds_spaces", force: true do |t|
    t.integer  "detailed_id"
    t.integer  "space_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "num_of_people", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.integer  "space_id"
  end

  create_table "rent_envs", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rent_envs_spaces", force: true do |t|
    t.integer  "rent_env_id"
    t.integer  "space_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "space_settings", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spaces", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.decimal  "price_hour"
    t.decimal  "price_day"
    t.decimal  "price_month"
    t.decimal  "price_year"
    t.integer  "space_setting_id"
    t.integer  "user_group_id"
    t.integer  "city_id"
    t.integer  "atmosphere_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "num_of_people_id"
    t.string   "address"
    t.integer  "user_id"
  end

  add_index "spaces", ["atmosphere_id"], name: "index_spaces_on_atmosphere_id"
  add_index "spaces", ["city_id"], name: "index_spaces_on_city_id"
  add_index "spaces", ["space_setting_id"], name: "index_spaces_on_space_setting_id"
  add_index "spaces", ["user_group_id"], name: "index_spaces_on_user_group_id"
  add_index "spaces", ["user_id", "created_at"], name: "index_spaces_on_user_id_and_created_at"

  create_table "user_groups", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
