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

  def self.search(search)
    search = search.downcase
    where("LOWER(title) LIKE ? OR LOWER(description) LIKE ? OR LOWER(address) LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  def self.category_search(category_search)
    if category_search == "food"
      Event.food
    elsif category_search == "entertainment"
      Event.entertainment
    elsif category_search == "lifestyle"
      Event.lifestyle
    else
      Event.all
    end
  end
end
