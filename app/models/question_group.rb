class QuestionGroup < ActiveRecord::Base
  attr_accessible :title, :virtual, :position, :survey_id

  belongs_to :survey
  has_many :questions

end