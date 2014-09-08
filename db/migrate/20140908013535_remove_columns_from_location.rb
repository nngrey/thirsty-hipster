class RemoveColumnsFromLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :latitude, :string
    remove_column :locations, :longitude, :string
  end
end
