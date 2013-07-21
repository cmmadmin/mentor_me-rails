class Question < ActiveRecord::Base
  extend Enumerize

  attr_accessible :body, :question_type, :question_group_id, :position

  belongs_to :question_group
  has_many :answers

  enumerize :question_type, in: [:text, :number, :boolean]

  validates :body, :presence => true
  validates :question_type, :presence => true 

  def question_type_enum
    self.class.enumerized_attributes[:question_type].values.map { |value| [value.text, value.to_s] }
  end
end
