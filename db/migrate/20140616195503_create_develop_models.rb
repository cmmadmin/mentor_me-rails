class CreateDevelopModels < ActiveRecord::Migration
  def change
    create_table :develop_categories do |t|
      t.string :title, :null => false
    end
    create_table :develop_curriculums do |t|
      t.string :type, :null => false
      t.integer :parent_id
    end
    create_table :develop_goals do |t|
      t.references :develop_curriculum, :null => false
      t.references :develop_category, :null => false
      t.string :title, :null => false
      t.text :description
      t.foreign_key :develop_curriculums
      t.foreign_key :develop_categories
    end
    create_table :develop_items do |t|
      t.references :develop_curriculum, :null => false
      t.references :develop_goal, :null => false
      t.string :title, :null => false
      t.text :description
      t.string :link_url
      t.foreign_key :develop_curriculums
      t.foreign_key :develop_goals
    end
    create_table :develop_goal_picks do |t|
      t.references :mentee_profile, :null => false
      t.references :develop_goal, :null => false
      t.foreign_key :mentee_profiles
      t.foreign_key :develop_goals
    end
    create_table :develop_item_picks do |t|
      t.references :mentee_profile, :null => false
      t.references :develop_item, :null => false
      t.foreign_key :mentee_profiles
      t.foreign_key :develop_items
    end
    create_table :develop_custom_items do |t|
      t.references :mentee_profile, :null => false
      t.string :title, :null => false
      t.text :description
      t.foreign_key :mentee_profiles
    end
  end
end
