class Mentee < ActiveRecord::Base
  attr_accessible :birth_date, :email, :major, :name, :phone
  has_many :testings, :conditions => proc{'name = "test"'}
end
