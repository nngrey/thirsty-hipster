require 'faker'

def seed_locations
  10.times do |t|
    location = Location.create!(
      name: Faker::Company.name,
      address: "2117 NE Oregon St",
      city: "Portland",
      state: "OR",
      start_time: ["2000-01-01 17:00:00", "2000-01-01 18:00:00", "2000-01-01 19:00:00", "2000-01-01 20:00:00", "2000-01-01 21:00:00", "2000-01-01 22:00:00", "2000-01-01 23:00:00"].sample,
      end_time: "2000-01-01 23:30:00",
      description: Faker::Lorem.sentence,
      url: Faker::Internet.url,
      rating: "rating",
      zip: "97232",
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
      phone: Faker::PhoneNumber.phone_number,
    )
  update_latlong_and_street(location)
  end
  10.times do |t|
    location = Location.create!(
      name: Faker::Company.name,
      address: "910 NW 14th Ave",
      city: "Portland",
      state: "OR",
      start_time: ["2000-01-01 17:00:00", "2000-01-01 18:00:00", "2000-01-01 19:00:00", "2000-01-01 20:00:00", "2000-01-01 21:00:00", "2000-01-01 22:00:00", "2000-01-01 23:00:00"].sample,
      end_time: "2000-01-01 23:30:00",
      description: Faker::Lorem.sentence,
      url: Faker::Internet.url,
      rating: "rating",
      zip: "97209",
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
      phone: Faker::PhoneNumber.phone_number,
    )
  update_latlong_and_street(location)
  end
  10.times do |t|
    location = Location.create!(
      name: Faker::Company.name,
      address: "1939 SW 6th Ave",
      city: "Portland",
      state: "OR",
      start_time: ["2000-01-01 17:00:00", "2000-01-01 18:00:00", "2000-01-01 19:00:00", "2000-01-01 20:00:00", "2000-01-01 21:00:00", "2000-01-01 22:00:00", "2000-01-01 23:00:00"].sample,
      end_time: "2000-01-01 23:30:00",
      description: Faker::Lorem.sentence,
      url: Faker::Internet.url,
      rating: "rating",
      zip: "97201",
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
      phone: Faker::PhoneNumber.phone_number,
    )
  update_latlong_and_street(location)
  end
  10.times do |t|
    location = Location.create!(
      name: Faker::Company.name,
      address: "1124 SW Alder St",
      city: "Portland",
      state: "OR",
      start_time: ["2000-01-01 17:00:00", "2000-01-01 18:00:00", "2000-01-01 19:00:00", "2000-01-01 20:00:00", "2000-01-01 21:00:00", "2000-01-01 22:00:00", "2000-01-01 23:00:00"].sample,
      end_time: "2000-01-01 23:30:00",
      description: Faker::Lorem.sentence,
      url: Faker::Internet.url,
      rating: "rating",
      zip: "97205",
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
      phone: Faker::PhoneNumber.phone_number,
    )
  update_latlong_and_street(location)
  end
  10.times do |t|
    location = Location.create!(
      name: Faker::Company.name,
      address: "1400 SE Morrison St",
      city: "Portland",
      state: "OR",
      start_time: ["2000-01-01 17:00:00", "2000-01-01 18:00:00", "2000-01-01 19:00:00", "2000-01-01 20:00:00", "2000-01-01 21:00:00", "2000-01-01 22:00:00", "2000-01-01 23:00:00"].sample,
      end_time: "2000-01-01 23:30:00",
      description: Faker::Lorem.sentence,
      url: Faker::Internet.url,
      rating: "rating",
      zip: "97214",
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
      phone: Faker::PhoneNumber.phone_number,
    )
  update_latlong_and_street(location)
  end
end

def update_latlong_and_street(location)
  location['longitude'] = location['longitude'] + [0.004, -0.004, 0.0000, 0.002, -0.002].sample
  location['latitude'] = location['latitude'] + [0.004, -0.004, 0.0000, 0.002, -0.002].sample
  location['address'] = Faker::Address.street_address
  location.save(validate: false)
end

seed_locations
