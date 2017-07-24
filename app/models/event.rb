class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  belongs_to :user, optional: true
  enum area: [:subang_jaya, :damansara, :ttdi]
  enum category:[:food, :lifestyle, :entertainment]
end
