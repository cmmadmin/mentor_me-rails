class Survey < ActiveRecord::Base
  attr_accessible :edition_id, :default_question_group_id, :question_group_ids
  
  belongs_to :edition
  belongs_to :default_question_group, :class_name => "QuestionGroup"
  has_many :question_groups
  # has_one :default_group, where(virtual: true)
  has_many :questions, :through => :question_groups
end