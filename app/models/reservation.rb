class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu_item, counter_cache: :cur_reservations
  has_one :restaurant, through: :menu_item
  has_one :meal, through: :menu_item

  default_scope includes(:menu_item, :meal, :restaurant)

  attr_accessible :user_id, :menu_item_id, :time_slot

  # before_create :validate_purchase
  after_create :send_sms

  # Send an SMS informing the user his reservation was successful
  def send_sms
    # user = self.user
    # UserMailer.reservation_sms(user).deliver if user.telephone?
  end

  def validate_purchase
    # validations: number of seats, enough credits, etc...
  end
end
