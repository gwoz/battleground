class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.boolean :in_battle, default: false
      t.string :avatar

      t.timestamps null: false
    end
  end
end
