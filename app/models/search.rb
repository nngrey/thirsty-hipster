class Search

  def yelp_check(zip)

    api_host = 'api.yelp.com'

    consumer = OAuth::Consumer.new(ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET'], {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, ENV['TOKEN'], ENV['TOKEN_SECRET'])

    path = "/v2/search?term=bars&location=" + zip

    parsed_data = JSON.parse(access_token.get(path).body)

    locations_data = parsed_data['businesses']

    @found_locations = []

    if locations_data
      locations_data.each do |location|
        new_location = Location.new(name: location["name"], address: location["location"]["address"][0], city: location["location"]["city"], state: location["location"]["state_code"], rating: location["rating_img_url"], zip: location["location"]["postal_code"])
        @found_locations << new_location
      end
    end
    @found_locations
  end
end

