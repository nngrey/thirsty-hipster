class AddRaitingToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :rating, :string
  end
end
