class User < ApplicationRecord
  include Clearance::User

  has_many :events
  has_many :comments
  has_many :votes

  enum status: [:newbie, :intermediate, :expert]
end
