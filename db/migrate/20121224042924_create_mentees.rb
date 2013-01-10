class CreateMentees < ActiveRecord::Migration
  def change
    create_table :mentees do |t|
      t.string :name
      t.date :birth_date
      t.string :major
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
