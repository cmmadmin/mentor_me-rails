class QuestionsController < ApplicationController
  respond_to :json
  inherit_resources

  belongs_to :question_group, :shallow => true
end