collection @menu_items
attributes :id, :restaurant_id, :meal_id, :date, :max_reservations, :cur_reservations

glue :meal do
  attributes :name, :price, :image
end

if @include_restaurants
  child :restaurant do
    attributes :name, :coordinates, :address
  end
end
