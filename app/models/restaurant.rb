class Restaurant < ActiveRecord::Base
  attr_accessible :address, :coordinates, :name
end
