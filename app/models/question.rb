class Question < ActiveRecord::Base
  extend Enumerize

  attr_accessible :body, :develop_category, :answer_type

  enumerize :develop_category, in: [:snapshot, :develop, :lifelist]
  enumerize :answer_type, in: [:text, :number, :boolean]

  validates :body, :presence => true
  validates :develop_category, :presence => true
  validates :answer_type, :presence => true 

  def develop_category_enum
    self.class.enumerized_attributes[:develop_category].values.map { |value| [value.text, value.to_s] }
  end
  def answer_type_enum
    self.class.enumerized_attributes[:answer_type].values.map { |value| [value.text, value.to_s] }
  end
end
