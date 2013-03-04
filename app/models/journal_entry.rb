class JournalEntry < ActiveRecord::Base
  attr_accessible :body, :created_at, :mentee_id

  belongs_to :mentee

  validates :body, :presence => true
  validates :mentee, :presence => true
end
