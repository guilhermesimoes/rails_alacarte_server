class CreateMenus < ActiveRecord::Migration
  def self.up
    create_table :menus do |t|
      t.integer :restaurant_id, :null => false
      t.date :date

      t.timestamps
    end

    add_index :menus, :restaurant_id
  end

  def self.down
    drop_table :menus

    remove_index :menus, :restaurant_id
  end
end
