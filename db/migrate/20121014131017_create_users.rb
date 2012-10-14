class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :telephone
      t.string :name
      t.float :credits, :null => false, :default => 0

      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Token authenticatable
      t.string :authentication_token

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :authentication_token, :unique => true
  end

  def self.down
    drop_table :users

    remove_index :users, :email
    remove_index :users, :reset_password_token
    remove_index :users, :authentication_token
  end
end
