object @curriculum

attributes :id, :type

child :develop_goals, :object_root => false, :if => lambda {|c| c.type == 'DevelopGoalsCurriculum'} do
  attributes :id, :develop_curriculum_id, :develop_category_id, :title, :description
end

child :develop_items, :object_root => false, :if => lambda {|c| c.type == 'DevelopItemsCurriculum'} do
  attributes :id, :develop_curriculum_id, :develop_goal_id, :label, :description, :link_url
end