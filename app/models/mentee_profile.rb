class MenteeProfile < ActiveRecord::Base
  attr_accessible :mentee_id, :edition_id, :mentee, :edition, 
    :snapshot_state
  
  belongs_to :mentee
  belongs_to :edition

  has_many :develop_goal_picks
  has_many :develop_goals, through: :develop_goal_picks

  has_many :develop_item_picks
  has_many :develop_items, through: :develop_item_picks

  has_many :answers

  validates :mentee, presence: true
  validates :edition, presence: true
end