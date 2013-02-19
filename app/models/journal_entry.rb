class JournalEntry < ActiveRecord::Base
  attr_accessible :body

  belongs_to :mentee
end
