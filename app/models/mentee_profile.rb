class MenteeProfile < ActiveRecord::Base
  belongs_to :mentee
  belongs_to :edition

  has_many :answers

  validates :mentee, :presence => true
  validates :edition, :presence => true
end