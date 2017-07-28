class User < ApplicationRecord
  include Clearance::User

  has_many :events
  has_many :comments
  has_many :votes
  acts_as_voter
  enum status: [:newbie, :intermediate, :expert]

  geocoded_by :address,:latitude => :latitude, :longitude => :longitude
  after_validation :geocode

  def check_status(user)
    if Event.where(user_id: user.id).count == 0 || Event.where(user_id: user.id).count <2
      user.newbie!
    elsif Event.where(user_id: user.id).count > 1 || Event.where(user_id: user.id).count <3
      user.intermediate!
    else
      user.expert!
    end
  end
end
