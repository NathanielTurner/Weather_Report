require 'httparty'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'weather.sqlite3'
)

require './migrations.rb'
require './condition.rb'
require './ten_day.rb'
require './current_alert.rb'
require './hurricane.rb'

WeatherReportMigration.migrate(:up)
