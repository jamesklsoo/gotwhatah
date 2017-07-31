class User < ApplicationRecord
  include Clearance::User

  has_many :events
  has_many :comments
  has_many :votes
  acts_as_voter
  enum status: [:kid, :awesome, :legend]

  geocoded_by :address,:latitude => :latitude, :longitude => :longitude
  after_validation :geocode

  def check_status(user)
    if Event.where(user_id: user.id).count == 0 || Event.where(user_id: user.id).count < 5
      user.kid!
      user.status
    elsif Event.where(user_id: user.id).count > 4 || Event.where(user_id: user.id).count < 7
      user.awesome!
      user.status
    else
      user.legend!
      user.status
    end
  end
end
