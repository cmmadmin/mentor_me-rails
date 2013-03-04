class Mentee < ActiveRecord::Base
  attr_accessible :birth_date, :email, :major, :name, :phone, :notes

  belongs_to :mentor, :class_name => User
  has_many :journal_entries

  validates :name, :presence => true
end