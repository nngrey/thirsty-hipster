class Location < ActiveRecord::Base
  validates_presence_of :name, :address, :city, :state, :start_time, :end_time

  has_many :comments
  has_many :users, through: :comments
end
