require 'spec_helper'

describe Comment do
  context 'creating' do
    it 'allows a signed in user to add a new comment' do
      user = FactoryGirl.create(:user)
      sign_in(user)
      visit new_location_path
      location = FactoryGirl.build(:location)
      create_location(location)
      page.should have_content "New location created"
    end
  end
end