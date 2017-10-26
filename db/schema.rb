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

ActiveRecord::Schema.define(version: 20171026130850) do

  create_table "chatboxes", force: :cascade do |t|
    t.string "userfrom"
    t.string "userto"
    t.string "msg"
    t.integer "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "chatbox_image_file_name"
    t.string "chatbox_image_content_type"
    t.integer "chatbox_image_file_size"
    t.datetime "chatbox_image_updated_at"
  end

  create_table "friendships", force: :cascade do |t|
    t.string "userid1", null: false
    t.string "userid2", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string "userid"
    t.string "interest_topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "userid"
    t.string "msg"
    t.integer "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "post_image_file_name"
    t.string "post_image_content_type"
    t.integer "post_image_file_size"
    t.datetime "post_image_updated_at"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", default: 0.0
    t.index ["cached_votes_down"], name: "index_posts_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_posts_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_posts_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_posts_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_posts_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_posts_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_posts_on_cached_weighted_total"
  end

  create_table "users", force: :cascade do |t|
    t.string "userid", null: false
    t.string "enc_password", null: false
    t.string "name"
    t.date "bithdate"
    t.string "sex"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

end
