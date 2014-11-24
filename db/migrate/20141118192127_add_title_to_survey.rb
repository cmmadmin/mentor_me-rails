class AddTitleToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :title, :string
    add_column :surveys, :position, :integer
  end
end
