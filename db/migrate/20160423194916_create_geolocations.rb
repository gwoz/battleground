class CreateGeolocations < ActiveRecord::Migration
  def change
    create_table :geolocations do |t|
      t.references :user
      t.st_point   :lonlat, geographic: true
      t.timestamps  null: false
    end
  end
end
