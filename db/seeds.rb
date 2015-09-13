require 'faker'

def seed_locations
  100.times do |t|
    location = Location.create!(
      name: Faker::Company.name,
      address: Faker::Address.street_name,
      city: "Portland",
      state: "OR",
      start_time: ["2000-01-01 17:00:00", "2000-01-01 18:00:00", "2000-01-01 19:00:00", "2000-01-01 20:00:00", "2000-01-01 21:00:00", "2000-01-01 22:00:00", "2000-01-01 23:00:00"].sample,
      end_time: "2000-01-01 24:00:00",
      description: Faker::Lorem.sentence,
      url: Faker::Internet.url,
      rating: "rating",
      zip: ["97204", "97205", "97209", "97227", "97212", "97232", "97214", "97201", "97211"].sample,
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
      phone: Faker::PhoneNumber.phone_number,
    )
  update_latlong(location)
  end
end

def update_latlong(location)
  # location['longitude'] = location['longitude'] + [0.0000012, 0.0000014, 0.0000016, -0.0000012, -0.0000014].sample
  location['latitude'] = location['latitude'] + [0.0000002, 0.0000004, 0.0000006, -0.0000002, -0.0000004].sample
end

seed_locations
