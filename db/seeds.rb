require 'faker'

def seed_locations
  15.times do
    location = Location.create(
      name: Faker::Company.name + (10 * rand().round).to_s,
      address: Faker::Address.street_name,
      city: "Portland",
      state: "OR",
      start_time: ["2000-01-01 17:00:00", "2000-01-01 18:00:00", "2000-01-01 19:00:00", "2000-01-01 20:00:00", "2000-01-01 21:00:00", "2000-01-01 22:00:00", "2000-01-01 23:00:00"].sample,
      end_time: "2000-01-01 24:00:00",
      description: Faker::Lorem.sentence,
      url: Faker::Internet.url,
      rating: "rating",
      zip: ["97201", "97202"].sample,
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
      phone: Faker::PhoneNumber.phone_number,
    )
      location['longitude'] = location['longitude'] + [(rand() * 0.005), (rand() * -0.005)].sample
      location['latitude'] = location['latitude'] + [(rand() * 0.005), (rand() * -0.005)].sample
      location.save
  end
end

seed_locations
