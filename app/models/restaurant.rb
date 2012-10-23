class Restaurant < ActiveRecord::Base
  has_many :menu_items, dependent: :destroy
  has_many :meals, through: :menu_items

  attr_accessible :name, :address, :coordinates, :image

  def self.with_next_seven_meals
    includes({menu_items: :meal}) #.where("menu_items.date >= ? AND menu_items.date <= ?", Date.today, Date.today+7.days) ... why doesn't this work ...
  end
end
