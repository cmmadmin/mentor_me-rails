class QuestionsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  inherit_resources

  belongs_to :question_group, :shallow => true
end