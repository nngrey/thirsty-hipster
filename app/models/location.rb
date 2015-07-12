class Location < ActiveRecord::Base
  attr_reader :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode

  # validates_presence_of :name, :address, :city, :state, :start_time, :end_time, :description
  # validates_absence_of :display_address

  has_many :comments
  has_many :users, through: :comments

  def day_sequence(location)
  	sequence = []
  	if sunday && monday && tuesday && wednesday && thursday && friday && saturday
  		sequence << "Sunday - Saturday"
  	elsif monday && tuesday && wednesday && thursday && friday 
  		sequence << "Monday - Friday"
  	else
  		if sunday
  			sequence << "Sunday"
  		end
  		if monday
  			sequence << "Monday"
  		end
			if tuesday
				sequence << "Tuesday"
			end
			if wednesday
				sequence << "Wednesday"
			end
			if thursday
				sequence << "Thursday"
			end
			if friday
				sequence << "Friday"
			end
			if saturday
				sequence << "Saturday"
			end
  	end
  	sequence.join(", ")
  end
end
