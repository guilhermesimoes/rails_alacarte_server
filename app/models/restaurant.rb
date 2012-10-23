class Restaurant < ActiveRecord::Base
  has_many :menu_items, dependent: :destroy
  has_many :meals, through: :menu_items

  attr_accessible :name, :address, :coordinates, :image
end
