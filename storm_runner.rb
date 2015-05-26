require 'httparty'
require "./application"
require "./migrations"
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'weather.sqlite3'
)

ApplicationMigration.migrate(:up)

condition = Condition.new.build_condition(27253)
puts condition.forcast_on

tenday = TenDay.new.build_ten_day(27253)
tenday.each {|i| puts i.forcast_on}

dusk_dawn = DuskDawn.new.build_dusk_dawn(27253)
puts dusk_dawn.sunrise_at
puts dusk_dawn.sunset_at

alert = CurrentAlert.new.build_alert(27253)
if alert == "none"
  puts "There are no current local alerts for the location you requested."
else
  puts alert.description
end

hurricanes = Hurricane.new.build_hurricane(27253)
puts hurricanes[0].location
