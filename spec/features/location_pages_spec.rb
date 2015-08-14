require 'spec_helper'

describe Location do
  let!(:user){ FactoryGirl.create(:user) }
  let!(:location){ FactoryGirl.build(:location) }

  before do 
    Geocoder.configure(:lookup => :test)
    Geocoder::Lookup::Test.add_stub(
      "New York, NY", [
        {
          'latitude'     => 40.7143528,
          'longitude'    => -74.0059731,
          'address'      => 'New York, NY, USA',
          'state'        => 'New York',
          'state_code'   => 'NY',
          'country'      => 'United States',
          'country_code' => 'US'
        }
      ]
    )
  end
  
  context 'creating' do
    it 'allows a signed in user to add a new comment' do
      sign_in(user)
      visit new_location_path
      create_location(location)
      page.should have_content "New location created"
    end
  end

  context 'editing' do
    before(:each){ location.save }
    
    it 'allows anyone to view the details of a location' do
      visit location_path(location)
      page.should have_content location.address
      # page.should_not have_content "Edit listing"
    end

    it 'allows a user who is signed in to edit their own location' do
      sign_in(user)
      visit location_path(location)
      click_link "Edit"
      page.should have_selector(:link_or_button, 'Update Location')
    end

    it 'allows user who is signed in to edit their own location' do
      sign_in(user)
      visit location_path(location)
      click_link "Edit"
      fill_in :location_address, with: Faker::Address.street_address
      click_button "Update Location"
      page.should have_content "Location updated."
    end

    it 'allows a user who is signed in to delete their own location' do
      sign_in(user)
      visit location_path(location)
      click_link "Delete"
      page.should have_content "Location has been removed."
    end
  end
end