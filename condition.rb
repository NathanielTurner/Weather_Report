class Condition < ActiveRecord::Base

  def data_getter(first, second, third)
    data = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/conditions/q/27253.json")
    data[first][second][third]
  end

  def build_condition(location)
    data = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/conditions/q/#{location}.json")
    self.name = "Current Condition"
    self.location = data["current_observation"]["display_location"]["full"]
    self.temp_f = data["current_observation"]["estimated"]["temp_f"]
    self.weather = data["current_observation"]["estimated"]["weather"]
  end
end
