class AddSundayToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :sunday, :boolean
  end
end
