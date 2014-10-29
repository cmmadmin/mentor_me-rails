class AddEditionToDevelopCategory < ActiveRecord::Migration
  def change
    add_column :develop_categories, :edition_id, :integer
    add_foreign_key :develop_categories, :editions
  end
end
