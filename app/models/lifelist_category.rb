class LifelistCategory < ActiveRecord::Base
  attr_accessible :title

  has_many :lifelist_items
end
