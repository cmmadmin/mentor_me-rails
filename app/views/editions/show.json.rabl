object @edition
attributes :id, :name, :code, :snapshot_interactive_survey_id, 
                  :snapshot_self_assessment_survey_id, :snapshot_observations_survey_id,
                  :develop_survey_id

if locals[:show_questions]
  child :surveys, :object_root => false do
    attributes :id, :edition_id, :default_question_group_id
    child :question_groups, :object_root => false do
    	attributes :id, :title, :virtual, :position, :survey_id
      child :questions, :object_root => false do
        attributes :id, :body, :question_type, :question_group_id, :position
      end
    end
  end
end