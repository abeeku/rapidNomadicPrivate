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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130710160937) do

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "content"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
    t.string   "privacy"
  end

  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.datetime "accepted_at"
  end

  add_index "friendships", ["user_id"], :name => "index_friendships_on_user_id"

  create_table "messages", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "reciever_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "messages", ["user_id"], :name => "index_messages_on_user_id"

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.string   "privacy"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "user_id"
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "whose_wall"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "user_infos", :force => true do |t|
    t.text     "bio"
    t.string   "website"
    t.string   "location"
    t.integer  "user_id"
    t.string   "post_color"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_infos", ["user_id"], :name => "index_user_infos_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.date     "date_of_birth"
    t.string   "cookie_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "admin"
    t.string   "profile_file_name"
    t.string   "profile_content_type"
    t.integer  "profile_file_size"
    t.datetime "profile_updated_at"
  end

end
