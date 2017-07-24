class RemoveLocationColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column(:events, :location_id)
  end
end
