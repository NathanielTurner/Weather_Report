require './weather_report.rb'
require 'minitest/autorun'
require 'minitest/pride'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'Wtest.sqlite3'
)
ActiveRecord::Migration.verbose = false

class WeatherReportTest < Minitest::Test

  def setup
    ApplicationMigration.migrate(:up)
  end

  def teardown
    ApplicationMigration.migrate(:down)
  end



end
