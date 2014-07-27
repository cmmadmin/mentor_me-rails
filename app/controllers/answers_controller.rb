class AnswersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  inherit_resources

  belongs_to :mentee_profile, :shallow => true
end