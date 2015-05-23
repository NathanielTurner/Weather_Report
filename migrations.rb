require './weather_report.rb'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'weather.sqlite3'
)

class WeatherReportMigration < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :name
      t.string :location
      t.float :temp_f
      t.string :weather
    end

    create_table :ten_days do |t|
      t.string :name
    end

    create_table :dusk_dawns do |t|
      t.string :name
    end

    create_table :current_alerts do |t|
      t.string :name
    end

    create_table :hurricanes do |t|
      t.string :name
    end
  end
end
