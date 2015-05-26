require "httparty"
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'weather.sqlite3'
)

class Hurricane < ActiveRecord::Base
  def build_hurricane(location)
    hurricane_data = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/currenthurricane/q/#{location}.json")
    if hurricane_data["currenthurricane"].length < 1
      return "none"
    end
    hurricanes = []
    hurricane_data["currenthurricane"].each do |h|
      hurricanes << Hurricane.create(name: h["stormInfo"]["stormName"],
                                  direction: h["Current"]["Movement"]["text"],
                                  location: "#{h["Current"]["lat"]} lat, and #{h["Current"]["lon"]}long",
                                  wind_speed: h["Current"]["WindSpeed"]["mph"],
                                  category: h["Current"]["Category"])
    end
    return hurricanes
  end
end
