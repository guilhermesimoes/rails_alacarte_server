object @reservation
attributes :id, :time_slot

glue :menu_item do
  attributes :date
end

glue :meal do
  attributes :name, :price, :image
end

glue :restaurant do
  attributes :name => :restaurant_name
end

child :user do
  attributes :id, :name, :credits
end
