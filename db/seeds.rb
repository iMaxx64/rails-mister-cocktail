require 'json'
require 'open-uri'

puts "Deleting all the ingredients & cocktails\o/"
Cocktail.destroy_all
Ingredient.destroy_all
url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
list = JSON.parse(user_serialized)
list["drinks"].each do |drink|
  Ingredient.create!(name: drink["strIngredient1"])
end
url2 = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail'
user_serialized2 = open(url2).read
list2 = JSON.parse(user_serialized2)
list2["drinks"].each do |drink|
  Cocktail.create!(
    name: drink["strDrink"],
    picture: "https://#{drink["strDrinkThumb"]}"
    )
end
puts "the end"
