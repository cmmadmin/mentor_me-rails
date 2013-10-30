class LifelistPick < ActiveRecord::Base
  belongs_to :mentee_profile
  belongs_to :lifelist_item
end