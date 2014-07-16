class Edition < ActiveRecord::Base
  attr_accessible :name, :code, :snapshot_interactive_survey_id, 
                  :snapshot_self_assessment_survey_id, :snapshot_observations_survey_id,
                  :develop_survey_id

  belongs_to :snapshot_self_assessment_survey, class_name: "Survey"
  belongs_to :snapshot_interactive_survey, class_name: "Survey"
  belongs_to :snapshot_observations_survey, class_name: "Survey"

  has_many :surveys
  has_many :mentee_profiles

  belongs_to :develop_goals_curriculum
  belongs_to :develop_items_curriculum

  def self.used_by_mentor mentor
    joins(:mentee_profiles => :mentee).
   		where(:mentees => {:mentor_id => mentor.id}).group("editions.id")
  end

  def self.default
    where(:code => "college").first
  end
  def create_surveys
    self.snapshot_self_assessment_survey = Survey.create(edition_id: self.id)
    self.snapshot_interactive_survey = Survey.create(edition_id: self.id)
    self.snapshot_observations_survey = Survey.create(edition_id: self.id)
    self.save()
  end
  def create_curriculums
    self.develop_goals_curriculum = DevelopGoalsCurriculum.create()
    self.develop_items_curriculum = DevelopItemsCurriculum.create()
    self.save()
  end
end