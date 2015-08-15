class Location < ActiveRecord::Base
  attr_reader :display_address, :latitude, :longitude

  geocoded_by :street_address
  before_create :geocode

  validates_presence_of :name, :address, :city, :state, :start_time, :end_time, :description

  has_many :comments
  has_many :users, through: :comments

  def street_address
    [address, city, state, 'US'].compact.join(', ')
  end

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
