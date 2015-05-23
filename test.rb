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

end
