require "httparty"
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'weather.sqlite3'
)

class DuskDawn < ActiveRecord::Base

  def build_dusk_dawn(location)
    solar_data = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/astronomy/q/#{location}.json")
    sunrise_data = solar_data["sun_phase"]["sunrise"]
    sunset_data = solar_data["sun_phase"]["sunset"]
    dusk_dawn = DuskDawn.create(sunrise_at: "#{sunrise_data["hour"]}:#{sunrise_data["minute"]}",
    sunset_at: "#{sunset_data["hour"]}:#{sunset_data["minute"]}")
    return dusk_dawn
  end
end
