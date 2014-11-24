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

ActiveRecord::Schema.define(:version => 20141118192127) do

  create_table "answers", :force => true do |t|
    t.text     "text_value"
    t.integer  "number_value"
    t.boolean  "boolean_value"
    t.boolean  "not_applicable"
    t.integer  "question_id",       :null => false
    t.integer  "mentee_profile_id", :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "develop_categories", :force => true do |t|
    t.string  "title",      :null => false
    t.integer "edition_id"
  end

  create_table "develop_curriculums", :force => true do |t|
    t.string  "type",      :null => false
    t.integer "parent_id"
  end

  create_table "develop_custom_items", :force => true do |t|
    t.integer "mentee_profile_id", :null => false
    t.string  "title",             :null => false
    t.text    "description"
  end

  create_table "develop_goal_picks", :force => true do |t|
    t.integer "mentee_profile_id", :null => false
    t.integer "develop_goal_id",   :null => false
  end

  create_table "develop_goals", :force => true do |t|
    t.integer "develop_curriculum_id", :null => false
    t.integer "develop_category_id",   :null => false
    t.string  "title",                 :null => false
    t.text    "description"
  end

  create_table "develop_item_picks", :force => true do |t|
    t.integer "mentee_profile_id", :null => false
    t.integer "develop_item_id",   :null => false
  end

  create_table "develop_items", :force => true do |t|
    t.integer "develop_curriculum_id", :null => false
    t.integer "develop_goal_id",       :null => false
    t.string  "label"
    t.text    "description"
    t.string  "link_url"
  end

  create_table "editions", :force => true do |t|
    t.string   "name",                               :null => false
    t.string   "code",                               :null => false
    t.integer  "revision"
    t.integer  "snapshot_self_assessment_survey_id"
    t.integer  "snapshot_interactive_survey_id"
    t.integer  "snapshot_observations_survey_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "develop_goals_curriculum_id"
    t.integer  "develop_items_curriculum_id"
  end

  create_table "journal_entries", :force => true do |t|
    t.text     "body",       :null => false
    t.integer  "mentee_id",  :null => false
    t.datetime "logged_at",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mentee_profiles", :force => true do |t|
    t.integer  "edition_id",     :null => false
    t.integer  "mentee_id",      :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "snapshot_state"
    t.string   "lifelist_state"
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

  create_table "question_groups", :force => true do |t|
    t.string   "title"
    t.boolean  "virtual"
    t.integer  "survey_id",  :null => false
    t.integer  "position",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.text     "body",              :null => false
    t.string   "question_type",     :null => false
    t.integer  "question_group_id", :null => false
    t.integer  "position",          :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
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
    t.integer  "edition_id",                :null => false
    t.integer  "default_question_group_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "title"
    t.integer  "position"
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "authentication_token"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  add_foreign_key "answers", "mentee_profiles", :name => "answers_mentee_profile_id_fk"
  add_foreign_key "answers", "questions", :name => "answers_question_id_fk"

  add_foreign_key "develop_categories", "editions", :name => "develop_categories_edition_id_fk"

  add_foreign_key "develop_custom_items", "mentee_profiles", :name => "develop_custom_items_mentee_profile_id_fk"

  add_foreign_key "develop_goal_picks", "develop_goals", :name => "develop_goal_picks_develop_goal_id_fk"
  add_foreign_key "develop_goal_picks", "mentee_profiles", :name => "develop_goal_picks_mentee_profile_id_fk"

  add_foreign_key "develop_goals", "develop_categories", :name => "develop_goals_develop_category_id_fk"
  add_foreign_key "develop_goals", "develop_curriculums", :name => "develop_goals_develop_curriculum_id_fk"

  add_foreign_key "develop_item_picks", "develop_items", :name => "develop_item_picks_develop_item_id_fk"
  add_foreign_key "develop_item_picks", "mentee_profiles", :name => "develop_item_picks_mentee_profile_id_fk"

  add_foreign_key "develop_items", "develop_curriculums", :name => "develop_items_develop_curriculum_id_fk"
  add_foreign_key "develop_items", "develop_goals", :name => "develop_items_develop_goal_id_fk"

  add_foreign_key "editions", "develop_curriculums", :name => "editions_develop_goals_curriculum_foreign_key", :column => "develop_goals_curriculum_id"
  add_foreign_key "editions", "develop_curriculums", :name => "editions_develop_items_curriculum_foreign_key", :column => "develop_items_curriculum_id"
  add_foreign_key "editions", "surveys", :name => "edition_interactive_survey_foreign_key", :column => "snapshot_interactive_survey_id"
  add_foreign_key "editions", "surveys", :name => "edition_observations_survey_foreign_key", :column => "snapshot_observations_survey_id"
  add_foreign_key "editions", "surveys", :name => "edition_self_assessment_survey_foreign_key", :column => "snapshot_self_assessment_survey_id"

end
