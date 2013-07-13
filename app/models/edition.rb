class Edition < ActiveRecord::Base
  attr_accessible :name, :code

  belongs_to :snapshot_self_assessment_survey, class_name: "Survey"
  belongs_to :snapshot_interactive_survey, class_name: "Survey"
  belongs_to :snapshot_observations_survey, class_name: "Survey"
  belongs_to :develop_survey, class_name: "Survey"

  has_many :surveys
  has_many :mentee_profiles

end