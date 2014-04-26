# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
  	name Faker::Lorem.name
    description Faker::Lorem.sentence
    address Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state
  end
end