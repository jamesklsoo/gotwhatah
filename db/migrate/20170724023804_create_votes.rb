class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :event_id
      t.integer :user_id
      t.integer :type_of_vote

      t.timestamps
    end
  end
end
