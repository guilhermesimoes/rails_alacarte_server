class MenuItem < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :meal
  has_many :reservations

  default_scope order('date ASC').includes(:meal)

  attr_accessible :restaurant_id, :meal_id, :date, :cur_reservations, :max_reservations

  def self.of_the_next_seven_days
    scoped # where('date >= ? AND date <= ?', Date.today, Date.today+7.days)
  end

  def collection_name
    "#{restaurant.name} #{date} #{meal.name}"
  end
end
