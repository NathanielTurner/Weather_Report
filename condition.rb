class Condition < ActiveRecord::Base

  def data_getter(first, second, third)
    data = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/conditions/q/27253.json")
    data[first][second][third]
  end
end
