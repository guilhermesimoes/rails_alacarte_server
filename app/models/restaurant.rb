class Restaurant < ActiveRecord::Base
  has_many :menu_items, dependent: :destroy
  has_many :meals, through: :menu_items

  attr_accessible :name, :address, :coordinates, :image, :description, :max_seats, :opening_hours

  def availability(date)
    @menu_items = menu_items.where(date: date)
    @reservations = Reservation.where(menu_item_id: @menu_items)

    time_slots = {}
    opening_hours.split(' ').each do |opening_hour|
      time_slots[opening_hour] = 0
    end

    @reservations.each do |reservation|
      time_slots[reservation.time_slot] += 1
    end
    time_slots
  end
end
