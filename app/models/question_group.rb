class QuestionGroup < ActiveRecord::Base
  attr_accessible :title, :virtual, :position, :survey_id, :question_ids

  belongs_to :survey
  has_many :questions

  acts_as_list scope: :survey

end