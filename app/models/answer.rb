class Answer < ActiveRecord::Base
  extend Enumerize

  attr_accessible :text_value, :number_value, :boolean_value

  belongs_to :mentee
  belongs_to :question


  def value
    send(question.answer_type + '_value')
  end

end
