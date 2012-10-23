object @reservation
attributes :id, :user_id, :time_slot

glue :menu_item do
  glue :meal do
    attributes :name, :price, :image
  end
end

glue :user do
  attributes :name => :user_name
end