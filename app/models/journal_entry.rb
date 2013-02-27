class JournalEntry < ActiveRecord::Base
  attr_accessible :body, :created_at

  belongs_to :mentee
end
