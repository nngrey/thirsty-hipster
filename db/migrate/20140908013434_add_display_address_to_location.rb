class AddDisplayAddressToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :display_address, :string
  end
end
