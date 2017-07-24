class Vote < ApplicationRecord
  belongs_to :event
  belongs_to :user
  enum type_of_vote:[:upvote, :downvote]
end
