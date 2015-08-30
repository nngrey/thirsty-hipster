require 'spec_helper'

describe Location do

  let!(:user){ FactoryGirl.create(:user) }
  let!(:location){ FactoryGirl.build(:location) }
  let!(:location1) { FactoryGirl.create( 
    :location, latitude: 45.509867, longitude: -122.6812479, wednesday: true,
    display_address: "123 Main St, Portland, OR 97201", zip: "97201" ) }
  let!(:location2) { FactoryGirl.create( 
    :location, latitude: 45.509868, longitude: -122.6812478, thursday: true,
    display_address: "321 Elm St, Portland, OR 97205", zip: "97205" ) }
  before(:all) do 
    Geocoder.configure(:lookup => :test)
    Geocoder::Lookup::Test.set_default_stub(
      [
        {
          'latitude'     => 40.7143528,
          'longitude'    => -74.0059731,
          'address'      => 'New York, NY, USA',
          'state'        => 'New York',
          'state_code'   => 'NY',
          'country'      => 'United States'
        }
      ]
    )
  end
  
  context 'create location path' do
    it 'allows a signed in user to add a new location' do
      params = {
      :address => "3939 N Mississippi",
      :city => "Portland",
      :display_address => "3939 N Mississippi Boise Portland, OR 97227",
      :name => "Bar Bar",
      :phone => "503-288-3895",
      :state => "OR",
      :zip => "97227",
      :controller => "locations",
      :action => "new"
      }
      sign_in(user)
      create_location(location, params)
    end
  end


  context 'index' do
    it 'defaults to zipcode 97201 and displays any relevant locations' do
      visit locations_path
      page.should have_content location1.name
    end

    it 'defaults to zipcode 97201 and displays any relevant locations' do
      visit locations_path
      fill_in('Zipcode', :with => '97205')
      click_button "Search"
      page.should have_content location2.name
    end

    it 'defaults to zipcode 97201 and displays any relevant locations', js: true do
      pending #I think there is an issue with how the js files are loading - it don't work
      visit locations_path
      page.has_content? "Search for Local Happy Hours"
      execute_script("initialize()")
      save_and_open_page
    end
  end

  context 'creating' do
    it 'allows a signed in user to create a new location' do
      pending #You cannot visit this page without passing params for the values
      user = FactoryGirl.create(:user)
      sign_in(user)
      visit new_location_path
      location = FactoryGirl.build(:location, wednesday: true)
      create_location(location)
      page.should have_content "New location created"
    end
  end

  context 'editing' do
    before(:each){ location.save }

    it 'allows anyone to view the details of a location' do
      location = FactoryGirl.create(:location, wednesday: true)
      visit location_path(location)
      page.should have_content location.address
      # page.should_not have_content "Edit listing"
    end

    it 'allows a user who is signed in to edit their own location' do
      sign_in(user)
      location = FactoryGirl.create(:location, wednesday: true)
      visit location_path(location)
      click_link "Edit"
      page.should have_selector(:link_or_button, 'Update Location')
    end

    it 'allows user who is signed in to edit their own location' do
      sign_in(user)
      location = FactoryGirl.create(:location, wednesday: true)
      visit location_path(location)
      click_link "Edit"
      fill_in :location_address, with: Faker::Address.street_address
      click_button "Update Location"
      page.should have_content "Location updated."
    end

    it 'allows a user who is signed in to delete their own location' do
      sign_in(user)
      location = FactoryGirl.create(:location, wednesday: true)
      visit location_path(location)
      click_link "Delete"
      page.should have_content "Location has been removed."
    end
  end
end