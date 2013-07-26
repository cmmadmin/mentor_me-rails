class MenteeProfile < ActiveRecord::Base
  attr_accessible :mentee_id, :edition_id, :mentee, :edition
  
  belongs_to :mentee
  belongs_to :edition

  has_many :answers

  validates :mentee, :presence => true
  validates :edition, :presence => true
end