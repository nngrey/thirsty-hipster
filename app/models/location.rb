class Location < ActiveRecord::Base
  validates_presence_of :name, :address, :city, :state, :start_time, :end_time
end
