class AddMenteeToUser < ActiveRecord::Migration
  def up
    change_table :mentees do |t|
      t.references :mentor
      t.foreign_key :users, column: 'mentor_id'
    end
  end
  def down
    change_table :mentees do |t|
      t.remove_column :mentor_id
      t.remove_foreign_key :users
    end
  end
end
