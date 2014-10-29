class Mentee < ActiveRecord::Base
  attr_accessible :birth_date, :email, :major, 
                  :name, :phone, :notes,
                  :avatar, :avatar_cache, :remove_avatar, :mentor_id, :profile_edition_code

  mount_uploader :avatar, AvatarUploader  

  belongs_to :mentor, :class_name => User
  has_many :journal_entries
  has_many :mentee_profiles
  has_one :active_profile, :class_name => MenteeProfile, :order => 'created_at DESC'

  validates :name, :presence => true

  # before_create :create_profile

  # # TODO: Have mobile app create profile based on edition
  # def create_profile
  #   self.active_profile = MenteeProfile.new(mentee: self, edition: Edition.default)
  # end
  # 
  def profile_edition_code= code
    if self.active_profile.nil?
      edition = Edition.find_by_code code
      self.active_profile = MenteeProfile.new(mentee: self, edition: edition) unless edition.nil?
    end
  end
end