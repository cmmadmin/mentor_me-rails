class MenteesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  
  inherit_resources

  protected
  def collection
    @mentees ||= end_of_association_chain.where(mentor_id: current_user)
  end
  def begin_of_association_chain
    current_user
  end
end
