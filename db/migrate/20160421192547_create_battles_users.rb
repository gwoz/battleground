class CreateBattlesUsers < ActiveRecord::Migration
  def change
    create_table :battles_users do |t|
      t.references :battle
      t.references  :user
    end
  end
end
