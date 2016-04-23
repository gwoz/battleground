class CreateGeolocation < ActiveRecord::Migration
  def change
    create_table :geolocation do |t|
      t.references :user
      t.float      :speed
      t.st_point   :lonlat, geographic: true
      t.float      :accuracy
      t.float      :heading
      t.float      :altitude
      t.float      :altitude_accuracy
      t.boolean    :is_heartbeat
      t.boolean    :sample
      t.boolean    :is_moving
      t.float      :odometer
      t.string     :uuid
      t.string     :activity_type
      t.float      :activity_confidence
      t.float      :battery_level
      t.boolean    :battery_is_charging
      t.string     :app_timestamp
      t.timestamps  null: false
    end
  end
end
