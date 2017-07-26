class RemoveAreaColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :area 
  end
end
