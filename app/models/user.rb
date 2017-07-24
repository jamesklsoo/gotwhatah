class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
  validates :name, presence: true

  has_many :events
  has_many :comments
  has_many :votes

  belongs_to :location
end
