class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
      t.string :name, :null => false
      t.string :address
      t.string :coordinates
      t.string :image
      t.text :description
      t.integer :max_seats
      t.string :opening_hours, :null => false, :default => "1200 1230 1300 1330 1400 1930 2000 2030"

      t.timestamps
    end

    add_index :restaurants, :name
  end

  def self.down
    drop_table :restaurants

    remove_index :restaurants, :name
  end
end
