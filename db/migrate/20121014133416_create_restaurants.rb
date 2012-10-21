class CreateRestaurants < ActiveRecord::Migration
  def self.up
    create_table :restaurants do |t|
      t.string :name, :null => false
      t.string :address
      t.string :coordinates
      t.string :image
      t.text :description

      t.timestamps
    end

    add_index :restaurants, :name
  end

  def self.down
    drop_table :restaurants

    remove_index :restaurants, :name
  end
end
