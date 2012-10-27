object @restaurant
attributes :id, :name, :image, :description, :address, :coordinates

child @menu_items => :meals do
  attributes :id, :date, :max_reservations, :cur_reservations
  glue :meal do
    attributes :name, :price, :image
  end
end
