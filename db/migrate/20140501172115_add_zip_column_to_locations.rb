class AddZipColumnToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :zip, :string
  end
end
