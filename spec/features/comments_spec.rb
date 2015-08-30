require 'spec_helper'

describe Comment do

  let!(:location1) { FactoryGirl.create( :location, latitude: 45.509867, longitude: -122.6812479, wednesday: true,
                                         display_address: "123 Main St, Portland, OR 97201", zip: "97201" ) }
  context 'creating' do
    it 'allows a signed in user to add a new comment' do
      user = FactoryGirl.create(:user)
      sign_in(user)
      visit "/locations/#{location1.id}"
      click_link 'New Comment'
      fill_in "Comment", with: "blah, blah"
      click_button "Comment"
      page.should have_content "blah, blah update delete"
    end
  end
end