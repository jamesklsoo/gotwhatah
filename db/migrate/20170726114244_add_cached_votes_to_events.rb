class AddCachedVotesToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :cached_votes_up, :integer, :default => 0
  end
end
