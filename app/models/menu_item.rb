class MenuItem < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :meal
  has_many :reservations

  default_scope includes(:restaurant, :meal)

  attr_accessible :restaurant_id, :meal_id, :date, :cur_reservations, :max_reservations

  def self.of_the_week
    where("date >= ? AND date <= ?", Time.now.beginning_of_week, Time.now.end_of_week)
  end

  def collection_name
    "#{restaurant.name} #{date} #{meal.name}"
  end
end
