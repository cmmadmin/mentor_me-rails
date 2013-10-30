class Lifelist < ActiveRecord::Base

  attr_accessible :edition_id

  belongs_to :edition
  has_many :lifelist_items
end