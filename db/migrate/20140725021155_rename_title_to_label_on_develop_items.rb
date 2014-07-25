class RenameTitleToLabelOnDevelopItems < ActiveRecord::Migration
  def change
    rename_column :develop_items, :title, :label
    change_column_null :develop_items, :label, true
  end
end
