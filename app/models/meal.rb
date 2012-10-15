class Meal < ActiveRecord::Base
  has_many :menu_items, dependent: :destroy
  has_many :restaurants, through: :menu_items

  attr_accessible :restaurant_ids, :name, :price, :image, :menu_items_attributes

  accepts_nested_attributes_for :menu_items
end
