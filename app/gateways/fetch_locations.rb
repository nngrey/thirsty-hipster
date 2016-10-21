class FetchLocations

  def process_request(input_name, input_city)
    name = input_name.strip.tr(" ", "+")
    city = input_city.strip.tr(" ", "_")
    api_host ='api.yelp.com'
    consumer = OAuth::Consumer.new(ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET'], {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, ENV['TOKEN'], ENV['TOKEN_SECRET'])
    path = "/v2/search?term=bars+#{name}&location=#{city}&limit=5"

    parsed_data = JSON.parse(access_token.get(path).body)
  end

  def process_response(response)
    locations_data = response['businesses']

    @locations = []

    if locations_data
      locations_data.each do |location|
        phone = (location["display_phone"]).gsub(/\+1\-/, '') if location["display_phone"]
        new_location = Location.new(
          name: location["name"],
          address: location["location"]["address"][0],
          city: location["location"]["city"],
          state: location["location"]["state_code"],
          rating: location["rating_img_url"],
          zip: location["location"]["postal_code"],
          phone: phone,
          display_address: (location["location"]["display_address"]).join(" ")
        )
        @locations << new_location
      end
    end
    @locations
  end
end