class User < ApplicationRecord
  include Clearance::User
  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :events
  has_many :comments
  has_many :votes

  belongs_to :location

  enum status: [:newbie, :intermediate, :expert]
end
