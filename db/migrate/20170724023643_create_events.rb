class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.integer :location_id
      t.string :title
      t.string :description
      t.date :start_date
      t.date :end_date
      t.integer :category

      t.timestamps
    end
  end
end
