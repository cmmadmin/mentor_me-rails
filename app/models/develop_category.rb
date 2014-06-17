class DevelopCategory < ActiveRecord::Base
  attr_accessible :title

  has_many :develop_goals
end