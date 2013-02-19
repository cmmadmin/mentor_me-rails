class AddNotesToMentee < ActiveRecord::Migration
  def change
    add_column :mentees, :notes, :text
  end
end
