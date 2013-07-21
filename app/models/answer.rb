class Answer < ActiveRecord::Base
  extend Enumerize

  attr_accessible :text_value, :number_value, :boolean_value, :mentee_profile_id, :question_id

  belongs_to :mentee_profile
  belongs_to :question

  validates :mentee_profile, :presence => true
  validates :question, :presence => true
  validates :number_value, :numericality => true, :allow_nil => true
  validates :boolean_value, :inclusion => { :in => [true, false] }, :allow_nil => true
  validate :must_have_one_value

  before_validation :strip_values

  strip_attributes :only => :text_value

  def value
    question && send(question.question_type + '_value')
  end

  def has_one_value?
    (!text_value.blank? && number_value.nil? && boolean_value.nil?) ||
    (text_value.nil? && !number_value.blank? && boolean_value.nil?) ||
    (text_value.nil? && number_value.nil? && !boolean_value.nil?)
  end
  def strip_values
    (Question.question_type.values - [question.andand.question_type]).each do |type|
      send(type+"_value=", nil)
    end
  end
  def must_have_one_value
    if value.nil?
      errors.add((question.andand.question_type || "") + "_value", "can't be blank")
    end
    if !has_one_value?
      errors.add(:text_value, "One and only one value must be set")
      errors.add(:boolean_value, "One and only one value must be set")
      errors.add(:number_value, "One and only one value must be set")
    end
  end
end
