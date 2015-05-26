require "httparty"
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'weather.sqlite3'
)

class CurrentAlert < ActiveRecord::Base

  def build_alert(location)
    alert_data = HTTParty.get("http://api.wunderground.com/api/#{ENV['WUNDERGROUND_KEY']}/alerts/q/#{location}.json")
    if alert_data["alerts"].length < 1
      return "none"
    end
    alert_data.each do |a|
      alert = CurrentAlert.create(description: a["description"],
                                  start_at: a["date"],
                                  stop_at: a["expires"],
                                  )
    end
  end

end
