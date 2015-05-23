require 'httparty'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'weather.sqlite3'
)

require './migrations.rb'
require './dusk_dawn.rb'
require './condition.rb'
require './ten_day.rb'
require './current_alert.rb'
require './hurricane.rb'
data = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/conditions/q/27253.json")
puts data["current_observation"]["display_location"]["city"]
#WeatherReportMigration.migrate(:up)
