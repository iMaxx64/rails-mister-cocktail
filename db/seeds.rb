require 'open-uri'
require 'json'

INFO = ["Sweet", "Strong"]


puts "open and read url api"
url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
buffer = open(url).read
result = JSON.parse(buffer)
result = result["drinks"].sample(15)
puts 'Cleaning database...'
Ingredient.destroy_all
puts "create 15 ingredients"
result.each do |drink|
  Ingredient.create!(name: drink["strIngredient1"])
end
puts "finished Ingredients"
puts "open and read url api"
url = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'
buff = open(url).read
result_d = JSON.parse(buff)
result_d = result_d["drinks"].sample(15)
puts 'Cleaning database...'
Cocktail.destroy_all
puts "create 15 cocktails"
result_d.each do |drink|
  c = Cocktail.new(name: drink["strDrink"])
  c.info = INFO.sample
  c.remote_picture_url = "https://#{drink['strDrinkThumb']}"
  c.save
end
puts "finished Cocktails"
puts "seed finished !!"
