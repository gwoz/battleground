class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :winner
      t.references :task
      t.timestamps null: false
    end
  end
end
