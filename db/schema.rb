#This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110202054006) do

  create_table "admins", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "album_photos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "album_id"
    t.string   "bphoto_file_name"
    t.string   "bphoto_content_type"
    t.integer  "bphoto_file_size"
  end

  create_table "albums", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
    t.string   "album_photo_id"
    t.string   "albumname"
    t.string   "albumlocation"
    t.string   "aphoto_file_name"
    t.string   "aphoto_content_type"
    t.integer  "aphoto_file_size"
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.datetime "created_at",                                     :null => false
    t.integer  "commentable_id",                 :default => 0,  :null => false
    t.string   "commentable_type", :limit => 15, :default => "", :null => false
    t.integer  "user_id",                        :default => 0,  :null => false
  end

  add_index "comments", ["user_id"], :name => "fk_comments_user"

  create_table "profiles", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "address"
    t.string   "user_id"
    t.string   "album_id"
    t.string   "albumphotos"
    t.string   "stories_id"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "rating",                      :default => 0
    t.datetime "created_at",                                  :null => false
    t.string   "rateable_type", :limit => 15, :default => "", :null => false
    t.integer  "rateable_id",                 :default => 0,  :null => false
    t.integer  "user_id",                     :default => 0,  :null => false
  end

  add_index "ratings", ["user_id"], :name => "fk_ratings_user"

  create_table "stories", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "albumname"
    t.string   "albumlocation"
    t.string   "aphoto_file_name"
    t.string   "storyname"
    t.string   "storydescription"
    t.string   "user_id"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "password"
    t.string   "conpass"
    t.string   "email"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.string   "salt"
    t.string   "hashed_password"
  end

end
