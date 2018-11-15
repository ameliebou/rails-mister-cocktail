require 'open-uri'

Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)

ingredients['drinks'].each do |ing|
  Ingredient.create!(name: ing['strIngredient1'])
end

puts 'ingredients seed done!'