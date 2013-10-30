class AddLifelistFields < ActiveRecord::Migration
  def change
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
  end
end
