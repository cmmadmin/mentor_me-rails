class DevelopCategory < ActiveRecord::Base
  attr_accessible :title, :edition_id

  belongs_to :edition

  has_many :develop_goals
end