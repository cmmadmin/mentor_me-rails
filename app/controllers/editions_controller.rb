class EditionsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  inherit_resources
end
