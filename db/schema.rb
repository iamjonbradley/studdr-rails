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

<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20110305151845) do
=======
ActiveRecord::Schema.define(:version => 20110228011001) do
>>>>>>> b834317a6c2c4cf0766ab93fdaa96472f7580400
=======
ActiveRecord::Schema.define(:version => 20110228011001) do
>>>>>>> b834317a6c2c4cf0766ab93fdaa96472f7580400

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
<<<<<<< HEAD
  create_table "images", :force => true do |t|
    t.string   "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

=======
>>>>>>> b834317a6c2c4cf0766ab93fdaa96472f7580400
=======
>>>>>>> b834317a6c2c4cf0766ab93fdaa96472f7580400
  create_table "posts", :force => true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "category_id"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
