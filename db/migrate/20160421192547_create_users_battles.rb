class CreateUsersBattles < ActiveRecord::Migration
  def change
    create_table :users_battles do |t|
      t.references :battle, null: false, index: true
      t.references  :user, null: false, index: true
    end
  end
end
