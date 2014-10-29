class DevelopCategory < ActiveRecord::Base
  attr_accessible :title

  belongs_to :edition

  has_many :develop_goals
end