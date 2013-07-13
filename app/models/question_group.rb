class QuestionGroup < ActiveRecord::Base
  attr_accessible :title, :virtual, :position

  belongs_to :survey
  has_many :questions

  validates :mentee, :presence => true
  validates :edition, :presence => true
end