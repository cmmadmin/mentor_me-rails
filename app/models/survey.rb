class Survey < ActiveRecord::Base
  attr_accessible :edition_id, :edition, :title, :position, :default_question_group_id, :question_group_ids
  
  belongs_to :edition
  belongs_to :default_question_group, :class_name => "QuestionGroup"
  has_many :question_groups
  # has_one :default_group, where(virtual: true)
  has_many :questions, :through => :question_groups

  acts_as_list scope: :edition

  strip_attributes :only => :text_value

  def create_default_question_group
    self.default_question_group = QuestionGroup.create(virtual: true, survey_id: self.id)
    self.save()
  end
end