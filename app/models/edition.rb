class Edition < ActiveRecord::Base
  attr_accessible :name, :code, :snapshot_interactive_survey_id, 
                  :snapshot_self_assessment_survey_id, :snapshot_observations_survey_id,
                  :develop_survey_id

  belongs_to :snapshot_self_assessment_survey, class_name: "Survey"
  belongs_to :snapshot_interactive_survey, class_name: "Survey"
  belongs_to :snapshot_observations_survey, class_name: "Survey"
  belongs_to :develop_survey, class_name: "Survey"

  has_many :surveys
  has_many :mentee_profiles

  def self.used_by_mentor mentor
    joins(:mentee_profiles => :mentee).
   		where(:mentees => {:mentor_id => mentor.id}).group("editions.id")
  end

  def self.default
    where(:code => "college").first
  end
end