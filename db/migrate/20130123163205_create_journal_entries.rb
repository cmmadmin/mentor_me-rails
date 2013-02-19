class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.text :body

      t.references :mentee
      t.foreign_key :mentees

      t.timestamps
    end
  end
end
