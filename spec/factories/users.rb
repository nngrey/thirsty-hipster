# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password Faker::Internet.password
    password_confirmation { |u| u.password }
    # host false
  end
end

# FactoryGirl.define do
#     sequence :name do |n|
#     Faker::Internet.user_name
#   end

#     sequence :email do |n|
#     Faker::Internet.safe_email
#   end

#   factory :user do
#     name
#     email
#     password 'foobarbaz'
#     password_confirmation 'foobarbaz'
#   end
# end