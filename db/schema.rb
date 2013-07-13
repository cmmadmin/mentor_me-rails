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

ActiveRecord::Schema.define(:version => 20130712100000) do

  create_table "answers", :force => true do |t|
    t.text     "text_value"
    t.integer  "number_value"
    t.boolean  "boolean_value"
    t.boolean  "not_applicable"
    t.integer  "question_id",   :null => false
    t.integer  "mentee_profile_id",    :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end
  

  create_table "editions", :force => true do |t|
    t.string   "name",          :null => false
    t.string   "code",          :null => false
    t.integer  "revision"
    t.integer  "snapshot_self_assessment_survey_id"
    t.integer  "snapshot_interactive_survey_id"
    t.integer  "snapshot_observations_survey_id"
    t.integer  "develop_survey_id"
    t.integer  "life_list_id"
    t.timestamps
  end
  
  create_table "journal_entries", :force => true do |t|
    t.text     "body",       :null => false
    t.integer  "mentee_id",  :null => false
    t.datetime "logged_at",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mentees", :force => true do |t|
    t.string   "name"
    t.date     "birth_date"
    t.string   "major"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "mentor_id"
    t.text     "notes"
    t.string   "avatar"
  end

  create_table "mentee_profiles", :force => true do |t|
    t.integer  "edition_id",  :null => false
    t.integer  "mentee_id",   :null => false
    t.timestamps
  end

  create_table "question_groups", :force => true do |t|
    t.string     "title"
    t.boolean    "virtual"
    t.integer    "survey_id",        :null => false
    t.integer    "position",         :null => false
    t.timestamps
  end

  create_table "questions", :force => true do |t|
    t.text       "body",             :null => false
    t.string     "question_type",    :null => false
    t.integer    "group_id",         :null => false
    t.integer    "position",         :null => false
    
    t.timestamps
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "surveys", :force => true do |t|
    t.integer "edition_id", :null => false
    t.integer "default_question_group_id"
    t.timestamps
  end

  create_table "testings", :force => true do |t|
    t.string  "name"
    t.integer "mentee_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true


  add_foreign_key :answers, :questions
  add_foreign_key :answers, :mentee_profiles

  add_foreign_key :editions, :surveys, column: 'snapshot_self_assessment_survey_id', name: 'edition_self_assessment_survey_foreign_key'
  add_foreign_key :editions, :surveys, column: 'snapshot_interactive_survey_id', name: 'edition_interactive_survey_foreign_key'
  add_foreign_key :editions, :surveys, column: 'snapshot_observations_survey_id', name: 'edition_observations_survey_foreign_key'
  add_foreign_key :editions, :surveys, column: 'develop_survey_id', name: 'develop_survey_foreign_key'

end
