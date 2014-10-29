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
lifelist_path = File.expand_path("../lifelist.csv", __FILE__)
curriculum_path = File.expand_path("../curriculum.tsv", __FILE__)


edition = Edition.where(name: 'CMT College Edition', code: 'college').first_or_create
edition.create_surveys
edition.create_curriculums

selfAssessGroups = %w(Physical Emotional Spiritual Finances)
selfAssessGroups += ["Relationships (Friends)", "Relationships (Romantic)", "Relationships (Parents)"]
selfAssessGroups += %w(Meaning/Purpose)
selfAssessGroups.each do |g|
  QuestionGroup.where(title: g, survey_id: edition.snapshot_self_assessment_survey.id).first_or_create
end

edition.snapshot_interactive_survey.create_default_question_group
edition.snapshot_observations_survey.create_default_question_group

CSV.foreach(selfassess_path, headers: true) do |row|
  hash = row.to_hash
  hash.keep_if{|key, value| %w(question_group body question_type).include? key}
  group = QuestionGroup.where(title: hash['question_group'], survey_id: edition.snapshot_self_assessment_survey.id).first
  Question.where(question_group_id: group.id, body: hash['body'], question_type: hash['question_type']).first_or_create if group
end

CSV.foreach(interactive_qa_path, headers: true) do |row|
  hash = row.to_hash
  hash.keep_if{|key, value| %w(body question_type).include? key}
  Question.where(body: hash['body'], question_type: hash['question_type'], question_group_id: edition.snapshot_interactive_survey.default_question_group.id).first_or_create
end

CSV.foreach(observe_path, headers: true) do |row|
  hash = row.to_hash
  hash.keep_if{|key, value| %w(body question_type).include? key}
  Question.where(body: hash['body'], question_type: hash['question_type'], question_group_id: edition.snapshot_observations_survey.default_question_group.id).first_or_create
end


item = {}
goals_curriculum = edition.develop_goals_curriculum
items_curriculum = edition.develop_items_curriculum
develop_category = develop_goal = develop_item = nil
CSV.foreach(curriculum_path, {headers: [:category, :goal_title, :goal_description, :label, :item_description, :item_link], col_sep: "\t", skip_blanks: true, quote_char: 4.chr}) do |row|
  next if $. == 1 # Skip header line
  # Incorporate any values that have changed
  item_hash = row.to_hash.delete_if{|k,v| v.nil? && ![:item_description, :item_link].include?(k) }
  item = item_hash.reverse_merge item
  
  develop_category = DevelopCategory.find_or_create_by_title(item[:category]) if item_hash[:category]
  develop_category.update(edition_id: edition.id)
  
  if item_hash[:goal_title]
    develop_goal = DevelopGoal.create!(title: item[:goal_title], description: item[:goal_description], develop_category: develop_category, develop_curriculum: goals_curriculum) 
  end

  if item_hash[:item_description]
    develop_item = DevelopItem.create!(label: item[:label], description: item[:item_description], link_url: item[:item_link],
        develop_goal: develop_goal, develop_curriculum: items_curriculum)
  end
end

# CSV.foreach(lifelist_path, headers: true) do |row|
#   hash = row.to_hash
#   hash.keep_if{|key, value| %w(category title).include? key}
#   category = LifelistCategory.where(title: hash['category']).first_or_create
#   LifelistItem.where(title: hash['title'], lifelist_id: edition.lifelist, lifelist_category_id: category.id).first_or_create
# end 