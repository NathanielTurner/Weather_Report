
class Condition < ActiveRecord::Base

  def data_getter(first, second, third)
    data = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/conditions/q/27253.json")
    data[first][second][third]
  end

  def build_condition(location)
    data = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/conditions/q/#{location}.json")
    better_data = data["current_observation"]
    self.location = better_data["display_location"]["full"]
    self.temp_f = better_data["temp_f"]
    self.weather = better_data["weather"]
    self.relative_humidity = better_data["relative_humidity"]
    self.wind_string = better_data["wind_string"]
    self.feelslike_f = better_data["feelslike_f"]
  end

end
