class CreateMeals < ActiveRecord::Migration
  def self.up
    create_table :meals do |t|
      t.string :name, :null => false
      t.float :price, :null => false
      t.string :image

      t.timestamps
    end

    add_index :meals, :name
  end

  def self.down
    drop_table :meals

    remove_index :meals, :name
  end
end
