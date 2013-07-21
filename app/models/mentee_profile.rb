class MenteeProfile < ActiveRecord::Base
  attr_accessible :mentee_id, :edition_id
  
  belongs_to :mentee
  belongs_to :edition

  has_many :answers

  validates :mentee, :presence => true
  validates :edition, :presence => true
end