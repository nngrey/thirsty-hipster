class AddDayColumnsToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :monday, :boolean
    add_column :locations, :tuesday, :boolean
    add_column :locations, :wednesday, :boolean
    add_column :locations, :thursday, :boolean
    add_column :locations, :friday, :boolean
    add_column :locations, :saturday, :boolean
  end
end
