class CreateMenuItems < ActiveRecord::Migration
  def self.up
    create_table :menu_items do |t|
      t.integer :restaurant_id, :null => false
      t.integer :meal_id, :null => false
      t.date :date, :null => false
      t.integer :max_reservations
      t.integer :cur_reservations, :default => 0

      t.timestamps
    end

    add_index :menu_items, :restaurant_id
    add_index :menu_items, :meal_id
  end

  def self.down
    drop_table :menu_items

    remove_index :menu_items, :restaurant_id
    remove_index :menu_items, :meal_id
  end
end
