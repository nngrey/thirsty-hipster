class Location < ActiveRecord::Base
  validates_presence_of :name, :address, :city, :state, :start_time, :end_time

  has_many :comments
  has_many :users, through: :comments

  def yelp_check
    # name = name.gsub(/\s/, '+')

    consumer_key = ENV['CONSUMER_KEY']
    consumer_secret = ENV['CONSUMER_SECRET']
    token = ENV['TOKEN']
    token_secret = ENV['TOKEN_SECRET']
    api_host = 'api.yelp.com'

    consumer = OAuth::Consumer.new(ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET'], {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, ENV['TOKEN'], ENV['TOKEN_SECRET'])

    path = "/v2/search?term=#{name}&category_filter=bars&location=Portland&limit=5"
    parsed_data = JSON.parse(access_token.get(path).body)

    locations_data = parsed_data['businesses']

    locations = []

    # hash.reject {|k,v| ![:a,:b].include?(k)}

    locations_data.each do |location|
      locations << location.reject {|key, value| !["name", "location"].include?(key)}
    end

    locations

    # locations = locations_data.first.reject {|key, value| key != "name"}

  end

end
