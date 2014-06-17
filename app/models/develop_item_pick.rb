class DevelopItemPick < ActiveRecord::Base
  belongs_to :mentee_profile
  belongs_to :develop_item
end