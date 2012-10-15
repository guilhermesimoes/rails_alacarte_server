class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu_item

  attr_accessible :user_id, :menu_item_id, :time_slot
end
