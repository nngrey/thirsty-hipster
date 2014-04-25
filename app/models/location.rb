class Location < ActiveRecord::Base
  validates_presence_of :name, :address, :city, :state, :start_time, :end_time
  before_create :make_search


  private

  def make_search

    response = RestClient::Request.new(
      :method => :get,
      :url => "http://api.yelp.com/v2/search?term=food&location=San+Francisco"
      )
  end

end


