class Meal < ActiveRecord::Base
  belongs_to :menu
  has_many :reservations, dependent: :destroy

  attr_accessible :menu_id, :name, :price, :image, :cur_reservations, :max_reservations
end
