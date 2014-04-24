class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.time :start_time
      t.time :end_time
      t.text :description
      t.string :url

      t.timestamps
    end
  end
end
