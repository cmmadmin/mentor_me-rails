class MenteeProfilesController < ApplicationController
  respond_to :json
  inherit_resources

  belongs_to :mentee, :shallow => true
end
