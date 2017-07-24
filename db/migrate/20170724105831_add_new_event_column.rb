class AddNewEventColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :area, :integer 
  end
end
