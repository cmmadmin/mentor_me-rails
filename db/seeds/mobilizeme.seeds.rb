require 'csv'

curriculum_path = File.expand_path("../mobilizeme_data/curriculum.tsv", __FILE__)
profilequestions_path = File.expand_path("../mobilizeme_data/profilequestions.tsv", __FILE__)

edition = Edition.where(code: 'mobilizeme')
unless edition.exists?
  edition = Edition.where(name: 'CMM Mobilize Me', code: 'mobilizeme').first_or_create
  # edition.create_surveys
  edition.create_curriculums

  item = {}
  goals_curriculum = edition.develop_goals_curriculum
  items_curriculum = edition.develop_items_curriculum

  develop_category = develop_goal = develop_item = nil
  CSV.foreach(curriculum_path, {headers: [:category, :goal_title, :goal_description, :item_title, :item_description, :item_link], col_sep: "\t", skip_blanks: true, quote_char: 4.chr}) do |row|
    next if $. == 1 # Skip header line
    # Incorporate any values that have changed
    item_hash = row.to_hash.delete_if{|k,v| v.nil? && ![:item_title, :item_link].include?(k) }
    item = item_hash.reverse_merge item
    
    if item_hash[:category]
      develop_category = DevelopCategory.find_or_create_by_title(item[:category]) 
      develop_category.update_attributes(edition_id: edition.id)
    end
    
    if item_hash[:goal_title]
      develop_goal = DevelopGoal.create!(title: item[:goal_title], description: item[:goal_description], develop_category: develop_category, develop_curriculum: goals_curriculum) 
    end

    if item_hash[:item_description]
      develop_item = DevelopItem.create!(description: item[:item_title], link_url: item[:item_link],
          develop_goal: develop_goal, develop_curriculum: items_curriculum)
    end
  end
end

edition = Edition.where(code: 'mobilizeme').first
unless edition.surveys.count > 0
  item = {}
  survey = survey_question = nil
  CSV.foreach(profilequestions_path, {headers: [:survey_title, nil, :question], col_sep: "\t", skip_blanks: true, quote_char: 4.chr}) do |row|
    next if $. == 1 # Skip header line
    item_hash = row.to_hash.delete_if{|k,v| v.nil?  }
    item = item_hash.reverse_merge item

    if item_hash[:survey_title]
      survey = Survey.create!(title: item[:survey_title], edition: edition)
      survey.create_default_question_group
    end
    if item_hash[:question]
      survey_question = Question.create!(body: item[:question], question_type: :text, question_group: survey.default_question_group)
    end
  end
end