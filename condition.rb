require "httparty"
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'weather.sqlite3'
)

class Condition < ActiveRecord::Base

  def build_condition(location)
    ten_day_data = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/forecast10day/q/#{location}.json")
    smaller_ten_day = ten_day_data["forecast"]["simpleforecast"]["forecastday"]
    current_data = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/conditions/q/#{location}.json")
    sliced_data = current_data["current_observation"]
    current_data["observation_time"]
    condition = Condition.create(name: "Today",
      forcast_on: sliced_data["observation_time"],
      forcast_at: sliced_data["display_location"]["full"],
      temp_f: sliced_data["temp_f"],
      weather: sliced_data["weather"],
      relative_humidity: sliced_data["relative_humidity"],
      wind_string: sliced_data["wind_string"],
      feelslike_f: sliced_data["feelslike_f"],
      low: smaller_ten_day[1]["low"]["fahrenheit"],
      high: smaller_ten_day[1]["high"]["fahrenheit"],
      average_humidity: smaller_ten_day[1]["avehumidity"],
      average_wind: smaller_ten_day[1]["avewind"]["mph"],
      text: ten_day_data["forecast"]["txt_forecast"]["forecastday"][0]["fcttext"],
      )
    return condition
  end

end
