class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu_item, counter_cache: :cur_reservations
  has_one :meal, through: :menu_item

  default_scope order('time_slot DESC')

  attr_accessible :user_id, :menu_item_id, :time_slot

  # before_create validations: number of seats, enough credits, etc...
  after_create :send_sms

  def send_sms
    # Send an SMS informing the user his reservation was successful
    # user = self.user
    # UserMailer.reservation_sms(user).deliver if user.telephone?
  end
end
