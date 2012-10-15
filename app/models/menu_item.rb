class MenuItem < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :meal
  has_many :reservations

  attr_accessible :restaurant_id, :meal_id, :date, :cur_reservations, :max_reservations
end
