# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
  	name Faker::Lorem.name
    description Faker::Lorem.sentence
    address Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state
    start_time "17:00:00"
    end_time "19:00:00"
  end
end