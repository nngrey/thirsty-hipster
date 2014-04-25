class Location < ActiveRecord::Base
  validates_presence_of :name, :address, :city, :state, :start_time, :end_time

  has_many :comments
  has_many :users, through: :comments

  def yelp_check
    name = name.gsub(/\s/, '+')

    consumer_key = ENV['CONSUMER_KEY']
    consumer_secret = ENV['CONSUMER_SECRET']
    token = ENV['TOKEN']
    token_secret = ENV['TOKEN_SECRET']
    api_host = 'api.yelp.com'

    consumer = OAuth::Consumer.new(ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET'], {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, ENV['TOKEN'], ENV['TOKEN_SECRET'])

    path = "/v2/search?term=Radio+Room&category_filter=bars&location=Portland&limit=3"
    yelp_data = JSON.parse(access_token.get(path).body)

    # ########################

    # response = RestClient::Request.new(
    #   :method => :get,
    #   :url => "http://api.yelp.com/v2/search?category_filter=bars&location=#{@location.name}",
    #   consumer = OAuth::Consumer.new(ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET'], {:site => "http://#{api_host}"})
    #   access_token = OAuth::AccessToken.new(consumer, ENV['TOKEN'], ENV['TOKEN_SECRET'])
    #   ).execute

    # api_host = 'api.yelp.com'

    # yelp_data = JSON(access_token.get(response).body)
  end

end
