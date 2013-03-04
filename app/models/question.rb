class Question < ActiveRecord::Base
  extend Enumerize

  attr_accessible :body, :develop_category, :answer_type

  enumerize :develop_category, in: [:snapshot, :develop, :lifelist]
  enumerize :answer_type, in: [:text, :number, :boolean]

  def develop_category_enum
    self.class.enumerized_attributes[:develop_category].values.map { |value| [value.text, value.to_s] }
  end
  def answer_type_enum
    self.class.enumerized_attributes[:answer_type].values.map { |value| [value.text, value.to_s] }
  end
end
