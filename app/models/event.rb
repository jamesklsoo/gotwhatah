class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :user, optional: true
  has_many :votes, dependent: :destroy
  has_many :comments
  mount_uploaders :images, ImageUploader
  enum area: [:subang_jaya, :damansara, :ttdi]
  enum category:[:food, :lifestyle, :entertainment]
  acts_as_votable
  geocoded_by :address, :latitude => :latitude, :longitude => :longitude
  after_validation :geocode
end
