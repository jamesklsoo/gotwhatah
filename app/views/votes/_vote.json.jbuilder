json.extract! vote, :id, :event_id, :user_id, :type_of_vote, :created_at, :updated_at
json.url vote_url(vote, format: :json)
