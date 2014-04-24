class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.belongs_to :location
      t.text :comment
      t.integer :rating
    end
  end
end
