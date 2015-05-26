require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: 'weather.sqlite3'
)

class ApplicationMigration < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :name
      t.string :forcast_on
      t.string :forcast_at
      t.string :weather
      t.float :temp_f
      t.string :high
      t.string :low
      t.string :relative_humidity
      t.integer :average_humidity
      t.string :wind_string
      t.integer :average_wind
      t.string :feelslike_f
      t.string :text
    end

    create_table :ten_days do |t|
      t.string :forcast_on
      t.string :early_text
      t.string :late_text
    end

    create_table :dusk_dawns do |t|
      t.string :sunrise_at
      t.string :sunset_at
    end

    create_table :current_alerts do |t|
      t.string :description
      t.string :start_at
      t.string :stop_at

    end

    create_table :hurricanes do |t|
      t.string :name
      t.string :direction
      t.string :location
      t.integer :wind_speed
      t.string :category
    end
  end
end
