class CreateUserLocations < ActiveRecord::Migration
  def change
    create_table :user_locations do |t|
      t.references :user, null: false, index: true
      t.float :lat, null: false, index: true
      t.float :long, null: false, index: true
    end
  end
end
