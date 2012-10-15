class Menu < ActiveRecord::Base
  belongs_to :restaurant
  has_many :meals, dependent: :destroy

  attr_accessible :restaurant_id, :date

  def self.all_this_week
    where("date > ? AND date < ?", Time.now.beginning_of_week, Time.now.end_of_week)
  end
end
