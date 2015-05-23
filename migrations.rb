class WeatherReportMigration < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :name
      t.string :location
      t.string :weather
      t.float :temp_f
      t.string :relative_humidity
      t.string :wind_string
      t.string :feelslike_f
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
