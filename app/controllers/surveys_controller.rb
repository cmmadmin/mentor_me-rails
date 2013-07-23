class SurveysController < ApplicationController
  respond_to :json
  inherit_resources

  belongs_to :edition, :shallow => true
end
