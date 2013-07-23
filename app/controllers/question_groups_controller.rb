class QuestionGroupsController < ApplicationController
  respond_to :json
  inherit_resources

  belongs_to :survey, :shallow => true
end
