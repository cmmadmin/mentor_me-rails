class Question < ActiveRecord::Base
  extend Enumerize

  attr_accessible :body, :question_type, :question_group_id, :question_group, :position

  belongs_to :question_group
  has_many :answers

  acts_as_list scope: :question_group

  enumerize :question_type, in: [:text, :number, :boolean]

  validates :body, :presence => true
  validates :question_type, :presence => true 

  strip_attributes :only => :text_value

  def question_type_enum
    self.class.enumerized_attributes[:question_type].values.map { |value| [value.text, value.to_s] }
  end
end
