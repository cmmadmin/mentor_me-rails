class AnswersController < ApplicationController
  respond_to :json, :html
  inherit_resources

  belongs_to :mentee
end