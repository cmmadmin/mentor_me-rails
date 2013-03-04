class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body
      t.string :develop_category
      t.string :answer_type

      t.timestamps
    end
  end
end
