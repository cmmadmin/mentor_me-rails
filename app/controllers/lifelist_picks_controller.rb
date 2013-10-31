class LifelistPicksController < ApplicationController
  respond_to :json
  inherit_resources

  belongs_to :mentee_profile, :shallow => true
end
