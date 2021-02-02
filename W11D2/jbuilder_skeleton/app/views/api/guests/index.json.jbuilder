# @guests.each do |guest|
#     # debugger
#     json.set! guest.id do
#         json.partial! "guest", guest: guest
#     end
# end
json.extract! @guests, :id, :name, :age, :favorite_color

# json.extract! guest, :name, :age, :favorite_color