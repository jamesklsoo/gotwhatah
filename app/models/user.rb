class User < ApplicationRecord
  include Clearance::User

  has_many :events
  has_many :comments
  has_many :votes
  acts_as_voter
  enum status: [:newbie, :intermediate, :expert]
end
