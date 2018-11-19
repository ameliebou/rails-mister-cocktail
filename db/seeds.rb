require 'open-uri'
Cocktail.destroy_all
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)

array = []

ingredients['drinks'].each do |ing|
  array << ing['strIngredient1']
end

array << 'Tonic water'

array.sort!

array.each { |el| Ingredient.create!(name: el) }

puts 'ingredients seed done!'
