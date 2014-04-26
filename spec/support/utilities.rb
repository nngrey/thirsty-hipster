def sign_in(user)
  visit root_url
  click_link "Sign in"
  fill_in :user_email, with: user.email
  fill_in :user_password, with: user.password
  click_button "Sign in"
end

def create_location(location)
  visit new_location_path
  fill_in :location_name, with: location.name
  fill_in :location_description, with: location.description
  fill_in :location_address, with: location.address
  fill_in :location_city, with: location.city
  fill_in :location_state, with: location.state
  click_button "Create Location"
end