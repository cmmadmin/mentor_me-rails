class DevelopGoalPick < ActiveRecord::Base
  belongs_to :mentee_profile
  belongs_to :develop_goal
end