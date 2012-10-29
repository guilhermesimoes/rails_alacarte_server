# encoding: UTF-8

class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu_item, counter_cache: :cur_reservations
  has_one :restaurant, through: :menu_item
  has_one :meal, through: :menu_item

  default_scope includes(:menu_item, :meal, :restaurant)

  attr_accessible :user_id, :menu_item_id, :time_slot

  validate :purchase, on: :create

  after_create :send_sms

  def send_sms
    UserMailer.reservation_sms(user, self).deliver if user.telephone?
  end

  def purchase
    if menu_item.cur_reservations == menu_item.max_reservations
      errors[:base] << "Não há comida que chegue para ti"
    end
    if meal.price > user.credits
      errors[:base] << "Não tens dinheiro que chegue"
    end
    if restaurant.availability(menu_item.date)[time_slot] == restaurant.max_seats
      errors[:base] << "Não há lugar para ti a esta hora"
    end
  end
end
