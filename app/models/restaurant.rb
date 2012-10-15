class Restaurant < ActiveRecord::Base
  has_many :menus, dependent: :destroy

  attr_accessible :name, :address, :coordinates, :image
end
