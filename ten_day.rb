require "httparty"
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'weather.sqlite3'
)

class TenDay < ActiveRecord::Base

  def build_ten_day(location)
    ten_day = []
    ten_day_data = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/forecast10day/q/#{location}.json")
    better_data = ten_day_data["forecast"]["txt_forecast"]["forecastday"]
    count = 0
    (0..19).step(2) do |i|
      day = ten_day_data["forecast"]["simpleforecast"]["forecastday"][count]["date"]["pretty"]
      count += 1
      ten_day << TenDay.create(forcast_on: day.slice(day.index("on")+3..-1),
                               early_text: better_data[i]["fcttext"],
                               late_text: better_data[i+1]["fcttext"],
                              )
    end
    return ten_day
  end

end
