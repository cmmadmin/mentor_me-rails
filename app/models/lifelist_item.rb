class LifelistItem < ActiveRecord::Base
  belongs_to :category, class_name: "LifelistCategory"
  belongs_to :lifelist

  attr_accessible :title, :lifelist_category_id
end