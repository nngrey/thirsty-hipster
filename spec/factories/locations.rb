# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name {Faker::Company.name}
    description Faker::Lorem.sentence
    address 'New York, NY, USA'
    city 'New York'
    state 'New York'
    latitude 40.7143528
    longitude -74.0059731
  end
end
