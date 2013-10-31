class LifelistPick < ActiveRecord::Base
  attr_accessible :mentee_profile_id, :lifelist_item_id
  belongs_to :mentee_profile
  belongs_to :lifelist_item
end