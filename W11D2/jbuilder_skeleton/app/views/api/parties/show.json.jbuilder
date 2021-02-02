json.extract! @party, :name

json.guests @party.guests do |guest|
    json.extract! guest, :name
    gift_var = guest.gifts
    json.gifts gift_var, :title
    # guest.gifts.each do |gift|
    #     json.extract! gift, :title
    # end
end