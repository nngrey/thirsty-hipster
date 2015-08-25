class Location < ActiveRecord::Base
  attr_reader :display_address, :latitude, :longitude

  geocoded_by :street_address
  after_validation :geocode

  validates_presence_of :name, :address, :city, :state, :start_time, :end_time, :description
  validates :name, :uniqueness => {:scope => :city}
  validate :days_were_selected

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

  private

  def days_were_selected
    days = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
    checked = false
    days.each do |day|
      checked = true if self[day].present?
    end
    if checked == false
      self.errors.add(:days, "- You must select at least one day.")
    end
  end
end
