require 'spec_helper'

describe Location do
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
