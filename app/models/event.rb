class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :user, optional: true
  enum area: [:subang_jaya, :damansara, :ttdi]
  enum category:[:food, :lifestyle, :entertainment]
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
