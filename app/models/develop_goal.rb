class DevelopGoal < ActiveRecord::Base
  attr_accessible :title, :description, :develop_category, :develop_curriculum

  belongs_to :develop_curriculum
  belongs_to :develop_category

  has_many :develop_items
end