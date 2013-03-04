class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|

      t.text :text_value
      t.integer :number_value
      t.boolean :boolean_value

      t.references :question
      t.references :mentee

      t.timestamps
    end
  end
end
