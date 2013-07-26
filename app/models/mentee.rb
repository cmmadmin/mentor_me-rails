class Mentee < ActiveRecord::Base
  attr_accessible :birth_date, :email, :major, 
                  :name, :phone, :notes,
                  :avatar, :avatar_cache, :remove_avatar, :mentor_id

  mount_uploader :avatar, AvatarUploader  

  belongs_to :mentor, :class_name => User
  has_many :journal_entries
  has_many :mentee_profiles
  has_one :active_profile, :class_name => MenteeProfile, :order => 'created_at DESC'

  validates :name, :presence => true

  before_create :create_profile

  # TODO: Have mobile app create profile based on edition
  def create_profile
    self.active_profile = MenteeProfile.new(mentee: self, edition: Edition.default)
  end
end