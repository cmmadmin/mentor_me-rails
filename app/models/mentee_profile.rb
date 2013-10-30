class MenteeProfile < ActiveRecord::Base
  attr_accessible :mentee_id, :edition_id, :mentee, :edition, 
    :snapshot_state, :develop_state, :lifelist_state
  
  belongs_to :mentee
  belongs_to :edition
  has_many :lifelist_picks
  has_many :lifelist_items, through: :lifelist_picks

  has_many :answers

  validates :mentee, presence: true
  validates :edition, presence: true
end