# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   
require 'csv'

selfassess_path = File.expand_path("../self_assess_questions.csv", __FILE__)
interactive_qa_path = File.expand_path("../interactive_qa_questions.csv", __FILE__)
observe_path = File.expand_path("../observe_questions.csv", __FILE__)
develop_path = File.expand_path("../develop_questions.csv", __FILE__)

edition = Edition.create(name: 'CMT College Edition', code: 'college')
edition.create_surveys

selfAssessGroups = %w(Physical Emotional Spiritual Finances)
selfAssessGroups += ["Relationships (Friends)", "Relationships (Romantic)", "Relationships (Parents)"]
selfAssessGroups += %w(Meaning/Purpose)
selfAssessGroups.each do |g|
  QuestionGroup.create(title: g, survey_id: edition.snapshot_self_assessment_survey.id)
end

edition.snapshot_interactive_survey.create_default_question_group
edition.snapshot_observations_survey.create_default_question_group
edition.develop_survey.create_default_question_group

CSV.foreach(selfassess_path, headers: true) do |row|
  hash = row.to_hash
  hash.keep_if{|key, value| %w(question_group body question_type).include? key}
  group = QuestionGroup.where(title: hash['question_group'], survey_id: edition.snapshot_self_assessment_survey.id).first
  Question.create(question_group_id: group.id, body: hash['body'], question_type: hash['question_type']) if group
end

CSV.foreach(interactive_qa_path, headers: true) do |row|
  hash = row.to_hash
  hash.keep_if{|key, value| %w(body question_type).include? key}
  Question.create(body: hash['body'], question_type: hash['question_type'], question_group_id: edition.snapshot_interactive_survey.default_question_group.id)
end

CSV.foreach(observe_path, headers: true) do |row|
  hash = row.to_hash
  hash.keep_if{|key, value| %w(body question_type).include? key}
  Question.create(body: hash['body'], question_type: hash['question_type'], question_group_id: edition.snapshot_observations_survey.default_question_group.id)
end

CSV.foreach(develop_path, headers: true) do |row|
  hash = row.to_hash
  hash.keep_if{|key, value| %w(body question_type).include? key}
  Question.create(body: hash['body'], question_type: hash['question_type'], question_group_id: edition.develop_survey.default_question_group.id)
end