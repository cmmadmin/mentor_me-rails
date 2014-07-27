class QuestionGroupsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  inherit_resources

  belongs_to :survey, :shallow => true
end
