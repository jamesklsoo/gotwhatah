class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :user, optional: true
  enum area: [:subang_jaya, :damansara, :ttdi]
  enum category:[:food, :lifestyle, :entertainment]
  geocoded_by :address, :latitude => :latitude, :longitude => :longitude
  after_validation :geocode

end
