require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'weather.sqlite3'
)

require './condition.rb'
require './ten_day.rb'
require './dusk_dawn.rb'
require './current_alert.rb'
require './hurricane.rb'
