require 'spec_helper'

describe Location do

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

  it { should validate_presence_of :name }
  it { should validate_presence_of :address }
  it { should validate_presence_of :city }
  it { should validate_presence_of :state }
  it { should validate_presence_of :start_time }
  it { should validate_presence_of :end_time }
  it { should have_many :comments }
  it { should have_many :users }
  it { should validate_uniqueness_of(:name).scoped_to(:city) }
end
