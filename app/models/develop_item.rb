class DevelopItem < ActiveRecord::Base
  attr_accessible :title, :description, :link_url, :develop_goal, :develop_curriculum

  belongs_to :develop_curriculum
  belongs_to :develop_goal
end