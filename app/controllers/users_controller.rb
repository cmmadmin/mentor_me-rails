class UsersController < ApplicationController
	# before_filter :authenticate_user!
	# TODO: Add authorization to make sure only this user can get bootstrap data
	def data
		current_user ||= User.first
		@mentees = current_user.mentees.includes(:active_profile => :answers)
		@editions = Edition.used_by_mentor(current_user).includes(:surveys => {:question_groups => :questions}, :lifelist => [:lifelist_items])
	end
end