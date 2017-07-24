class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
  validates :name, presence: true

  has_many :events
  has_many :comments
  has_many :votes

  belongs_to :location

  enum status: [:newbie, :intermediate, :expert]

  def check_status 
    if @user.comments.count == 0 && <10 
      @user.update!(status: 0)
    elsif @user.comments.count == >9 && <20 
      @user.update!(status: 1)
    else 
      @user.update!(status: 2) 
  end 
end
