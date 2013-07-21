class QuestionsController < ApplicationController
  respond_to :json
  inherit_resources

  # belongs_to :survey, :shallow => true do
  #   belongs_to :question_group, :shallow => true
  # end
end