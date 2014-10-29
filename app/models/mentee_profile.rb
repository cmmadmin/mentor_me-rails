class MenteeProfile < ActiveRecord::Base
  attr_accessible :mentee_id, :edition_id, :edition_code, :mentee, :edition, 
    :snapshot_state, :develop_goal_ids, :develop_item_ids
  
  belongs_to :mentee
  belongs_to :edition

  has_many :develop_goal_picks
  has_many :develop_goals, through: :develop_goal_picks

  has_many :develop_item_picks
  has_many :develop_items, through: :develop_item_picks

  has_many :answers

  validates :mentee, presence: true
  validates :edition, presence: true

  def edition_code= code
    self.edition = Edition.find_by_code code
  end
end