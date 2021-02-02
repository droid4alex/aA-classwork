json.extract! @guest, :name, :age, :favorite_color
json.gift_ids 

json.gifts do 
  json.array! @guest.gifts do |gift|
    json.extract! gift, :title, :description
  end
end

# json.extract! @gift, :title, :description


# # json.partial! 'guest', guest: @guest