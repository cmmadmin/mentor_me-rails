class JournalEntry < ActiveRecord::Base
  attr_accessible :body, :created_at, :mentee_id, :logged_at

  belongs_to :mentee

  validates :body, :presence => true
  validates :mentee, :presence => true

  before_save :set_logged_at

  private
  def set_logged_at
    self.logged_at = Time.now if logged_at.nil?
  end
end
