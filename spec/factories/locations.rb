# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :location do
    name "Lardo"
    address "333 12th Ave"
    city "Portland"
    state "OR"
    start_time "05:00pm"
    end_time "07:00pm"
  end
end
