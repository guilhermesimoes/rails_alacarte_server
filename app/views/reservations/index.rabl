collection @reservations
attributes :id, :user_id, :time_slot

glue :meal do
  attributes :name, :price, :image
end