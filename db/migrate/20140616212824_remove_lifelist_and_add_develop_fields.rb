class RemoveLifelistAndAddDevelopFields < ActiveRecord::Migration
  def up
    drop_table :lifelist_picks
    drop_table :lifelist_items
    drop_table :lifelists
    drop_table :lifelist_categories
    remove_foreign_key :editions, name: 'develop_survey_foreign_key'
    remove_column :editions, :life_list_id
    remove_column :editions, :develop_survey_id
    remove_column :mentee_profiles, :develop_state

    add_column :editions, :develop_goals_curriculum_id, :integer
    add_column :editions, :develop_items_curriculum_id, :integer
    add_foreign_key :editions, :develop_curriculums, name: 'editions_develop_goals_curriculum_foreign_key', column: 'develop_goals_curriculum_id'
    add_foreign_key :editions, :develop_curriculums, name: 'editions_develop_items_curriculum_foreign_key', column: 'develop_items_curriculum_id'
  end

  def down
    create_table :lifelist_categories do |t|
      t.string :title
    end
    create_table :lifelists do |t|
      t.references :edition
      t.foreign_key :editions
    end
    create_table :lifelist_items do |t|
      t.string :title
      t.references :lifelist
      t.foreign_key :lifelists
      t.references :lifelist_category
      t.foreign_key :lifelist_categories
    end
    create_table :lifelist_picks do |t|
      t.references :mentee_profile
      t.foreign_key :mentee_profiles
      t.references :lifelist_item
      t.foreign_key :lifelist_items
    end

    remove_foreign_key :editions, name: 'editions_develop_goals_curriculum_foreign_key'
    remove_foreign_key :editions, name: 'editions_develop_items_curriculum_foreign_key'
    remove_column :editions, :develop_goals_curriculum_id
    remove_column :editions, :develop_items_curriculum_id

    add_column :editions, :life_list_id, :integer
    add_column :editions, :develop_survey_id, :integer
    add_foreign_key "editions", "surveys", :name => "develop_survey_foreign_key", :column => "develop_survey_id"
    add_column :mentee_profiles, :develop_state, :string
  end
end
