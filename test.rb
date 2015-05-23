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
    WeatherReportMigration.migrate(:up)
  end

  def teardown
    WeatherReportMigration.migrate(:down)
  end

  def test_conditions_tables_can_be_created
    Condition.create(name: "cloudy")
    Condition.create(name: "clear")
    Condition.create(name: "rainy")
    Condition.create(name: "blazing_hot")
    assert_equal 4, Condition.all.count
  end

  def test_ten_day_tables_can_be_created
    TenDay.create(name: "fabulous")
    TenDay.create(name: "disastrous")
    TenDay.create(name: "biblical")
    TenDay.create(name: "meteors")
    assert_equal 4, TenDay.all.count
  end

  def test_hurricane_tables_can_be_created
    Hurricane.create(name: "Billy")
    Hurricane.create(name: "Santa")
    Hurricane.create(name: "Elvis")
    Hurricane.create(name: "Peter Pan")
    assert_equal 4, Hurricane.all.count
  end

  def test_current_alert_tables_can_be_created
    CurrentAlert.create(name: "meteor")
    CurrentAlert.create(name: "hail")
    CurrentAlert.create(name: "tornado")
    CurrentAlert.create(name: "monsoon")
    assert_equal 4, CurrentAlert.all.count
  end

  def test_dusk_dawn_tables_can_be_created
    DuskDawn.create(name: "rising")
    DuskDawn.create(name: "setting")
    DuskDawn.create(name: "exploding")
    DuskDawn.create(name: "collapsing")
    assert_equal 4, DuskDawn.all.count
  end

  def test_all_tables_simultaneously
    DuskDawn.create(name: "rising")
    CurrentAlert.create(name: "meteor")
    Hurricane.create(name: "Billy")
    TenDay.create(name: "fabulous")
    Condition.create(name: "cloudy")
    assert_equal 1, DuskDawn.all.count
    assert_equal 1, CurrentAlert.all.count
    assert_equal 1, Hurricane.all.count
    assert_equal 1, TenDay.all.count
    assert_equal 1, Condition.all.count
    assert_equal "rising", DuskDawn.last.name
    assert_equal "meteor", CurrentAlert.last.name
    assert_equal "fabulous", TenDay.last.name
  end

  def test_WU_api_is_getting_data
    condition = Condition.create(name: "nate")
    assert_equal "Graham, NC", condition.data_getter("current_observation", "display_location", "full")
    assert_equal "Graham", condition.data_getter("current_observation", "display_location", "city")
  end

  def test_conditions_have_locations_temps_and_weather
    condition = Condition.create(name: "Current Conditions", location: "Graham, NC", temp_f: 68.4, weather: "Clear")
    assert_equal "Graham, NC", condition.location
    assert_equal 68.4, condition.temp_f
    assert_equal "Clear", condition.weather
  end

  def test_conditions_can_be_set_from_api_data
    condition = Condition.create
    condition.build_condition(27253)
    assert_equal "Graham, NC", condition.location
  end

end
