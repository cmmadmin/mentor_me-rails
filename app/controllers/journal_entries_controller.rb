class JournalEntriesController < ApplicationController
  respond_to :json
  inherit_resources

  # belongs_to :mentee
end
