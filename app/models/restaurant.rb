class Restaurant < ActiveRecord::Base
  has_many :menu_items, dependent: :destroy
  has_many :meals, through: :menu_items

  attr_accessible :name, :address, :coordinates, :image

  def self.find_with_meals_of_the_week(id)
    includes({menu_items: :meal}).find(id)
    # .where("menu_items.date > ? AND menu_items.date < ?", Time.now.beginning_of_week, Time.now.end_of_week) ... why doesn't this work ...
  end
end
