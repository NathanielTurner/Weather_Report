class WeatherReportMigration < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :excetera
    end

    create_table :ten_days do |t|
      t.string :excetera
    end

    create_table :dusk_dawns do |t|
      t.string :excetera
    end

    create_table :current_alerts do |t|
      t.string :excetera
    end

    create_table :hurricans do |t|
      t.string :excetera
    end
  end
