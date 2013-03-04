class Question < ActiveRecord::Base
  extend Enumerize

  attr_accessible :body, :develop_category, :answer_type

  enumerize :develop_category, in: [:snapshot, :develop, :lifelist]
  enumerize :answer_type, in: [:text, :number, :boolean]
end
