# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100317071916) do

  create_table "command", :force => true do |t|
    t.string   "type"
    t.integer  "user_id"
    t.string   "source"
    t.string   "text"
    t.boolean  "processed", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  
  create_table "comments", :force => true do |t|
    t.integer   "post_id", :limit => 8
    t.integer   "status_id", :limit => 8
    t.string    "name"
    t.string    "text"
    t.datetime  "created_at"
    t.datetime  "updated_at"
  end
  
  create_table "posts", :force => true do |t|
    t.integer   "status_id", :limit => 8
    t.string    "name"
    t.string    "link"
    t.datetime  "created_at"
    t.datetime  "updated_at"
  end
  
  create_table "scores", :force => true do |t|
    t.integer  "user_id"
    t.integer  "points"
    t.string   "source"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  
  create_table "schema_migrations" do |t|
  end
  
  create_table "streams", :force => true do |t|
    t.string   "type"
    t.integer  "last_mention", :limit => 8
    t.integer  "last_comment", :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweaks", :force => true do |t|
    t.string  "name"
    t.text    "source"
    t.decimal "amount",     :precision => 6, :scale => 2, :default => 0.0
    t.integer "author_id" 
    t.boolean "approved"
    t.timestamps
  end
  
  create_table "tweaks_users", :force => true do |t|
    t.integer "tweak_id"
    t.integer "user_id"
  end
  
  create_table "users", :force => true do |t|
    t.string    "name"
    t.string    "login",               :null => false
    t.string    "email",               :null => false
    t.string    "crypted_password",    :null => false
    t.string    "password_salt",       :null => false
    t.string    "persistence_token",   :null => false
    t.string    "single_access_token", :null => false
    t.string    "perishable_token",    :null => false
    t.datetime  "created_at"
    t.datetime  "updated_at"
    # These are automatically maintained by Authlogic if they are present.
    t.integer   "login_count",         :null => false, :default => 0
    t.integer   "failed_login_count",  :null => false, :default => 0
    t.datetime  "last_request_at" 
    t.datetime  "current_login_at"
    t.datetime  "last_login_at"   
    t.string    "current_login_ip"
    t.string    "last_login_ip"   
  end
  
  create_table "twits", :force => true do |t|
    t.integer "twit_id", :limit => 8 
    t.string "name"
    t.integer "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
  
  create_table "follows", :force => true do |t|
    t.integer "user_id"
    t.integer "twit_id"
    t.string  "state"
  end
end
