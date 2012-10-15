class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.integer :user_id, :null => false
      t.integer :menu_item_id, :null => false
      t.datetime :time_slot

      t.timestamps
    end

    add_index :reservations, :user_id
    add_index :reservations, :menu_item_id
  end

  def self.down
    drop_table :reservations

    remove_index :reservations, :user_id
    remove_index :reservations, :menu_item_id
  end
end
