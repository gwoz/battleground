class AddUsersInBattle < ActiveRecord::Migration
  def change
    add_column :users, :in_battle, :boolean, default: false
  end
end
