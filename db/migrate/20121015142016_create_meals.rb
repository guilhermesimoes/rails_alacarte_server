class CreateMeals < ActiveRecord::Migration
  def self.up
    create_table :meals do |t|
      t.integer :menu_id, :null => false
      t.string :name, :null => false
      t.float :price, :null => false
      t.string :image
      t.integer :max_reservations
      t.integer :cur_reservations, :default => 0

      t.timestamps
    end

    add_index :meals, :menu_id
  end

  def self.down
    drop_table :meals

    remove_index :meals, :menu_id
  end
end
