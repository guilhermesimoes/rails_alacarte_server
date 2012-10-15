class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :meal

  attr_accessible :user_id, :meal_id, :time_slot
end
