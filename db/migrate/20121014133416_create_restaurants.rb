class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
      t.string :name, :null => false
      t.string :address
      t.string :coordinates

      t.timestamps
    end
  end

  def self.down
    drop_table :restaurants
  end
end
