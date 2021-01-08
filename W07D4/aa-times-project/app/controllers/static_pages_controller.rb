# require 'yahoo-weather'

class StaticPagesController < ApplicationController
  def index
    time = Time.new
    @today = time.strftime("%B %d, %Y")

    # @client = YahooWeather::Client.new
    # @response = @client.lookup_by_woeid(2487956)
	end
end
