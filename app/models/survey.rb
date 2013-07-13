class Survey < ActiveRecord::Base
  belongs_to :edition
  belongs_to :default_question_group
  has_many :question_groups
  # has_one :default_group, where(virtual: true)
  has_many :questions, :through => :question_groups
end