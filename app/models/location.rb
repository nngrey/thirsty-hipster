class Location < ActiveRecord::Base
  validates_presence_of :name, :address, :city, :state, :start_time, :end_time

  has_many :comments
  has_many :users, through: :comments

  def yelp_check
    # name = name.gsub(/\s/, '+')

    # consumer_key = ENV['CONSUMER_KEY']
    # consumer_secret = ENV['CONSUMER_SECRET']
    # token = ENV['TOKEN']
    # token_secret = ENV['TOKEN_SECRET']
    api_host = 'api.yelp.com'

    consumer = OAuth::Consumer.new(ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET'], {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, ENV['TOKEN'], ENV['TOKEN_SECRET'])

    path = "/v2/search?term=category_filter=bars&location=Portland&limit=10"

    parsed_data = JSON.parse(access_token.get(path).body)

    locations_data = parsed_data['businesses']

    locations = []
    locs = []

    locations_data.each do |location|
      new_location = Location.new(name: location["name"], address: location["location"]["address"][0], city: location["location"]["city"], state: location["location"]["state_code"], rating: location["rating_img_url"])
      locs << new_location
    end


    locs
  end

end
