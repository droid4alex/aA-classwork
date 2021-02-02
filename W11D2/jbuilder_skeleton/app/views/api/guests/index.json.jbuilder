json.array! @guests do |guest|    
  json.partial! "guest", guest: guest    
end

# json.extract! guest, :name, :age, :favorite_color