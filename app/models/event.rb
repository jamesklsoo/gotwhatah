class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :user
  belongs_to :location
  enum category:[:food, :lifestyle, :entertainment]
end
