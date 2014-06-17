class UsersController < ApplicationController
	# before_filter :authenticate_user!
	# TODO: Add authorization to make sure only this user can get bootstrap data
	def data
		current_user ||= User.first
		@mentees = current_user.mentees.includes(:active_profile => :answers)
		@editions = Edition.used_by_mentor(current_user).includes(:surveys => {:question_groups => :questions})
    curriculum_ids = @editions.map{|e| [e.develop_goals_curriculum_id, e.develop_items_curriculum_id]}.flatten.compact
    @curriculums = DevelopCurriculum.where(:id => curriculum_ids)
    @develop_categories = DevelopCategory.joins(:develop_goals).where(:develop_goals => {:develop_curriculum_id => curriculum_ids}).group(:"develop_categories.id")
	end
end