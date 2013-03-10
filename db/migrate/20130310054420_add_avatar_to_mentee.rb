class AddAvatarToMentee < ActiveRecord::Migration
  def change
    add_column :mentees, :avatar, :string
  end
end
