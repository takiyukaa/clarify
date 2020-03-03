# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
ProductsIngredient.destroy_all
Flag.destroy_all
Ingredient.destroy_all
puts "Ingredients destroyed"
puts "All users destroyed"
Review.destroy_all
Product.destroy_all
User.destroy_all
puts "Products and reviews destroyed"

puts "Creating new ingredients"
result = RestClient.get 'https://skincare-api.herokuapp.com/ingredients'

result_array = JSON.parse(result)[0..50]

result_array.each do |hash|
  Ingredient.create!(name: hash["ingredient"])
end

puts "Creating new users"
FRANCES = User.create!(
  email: "frances@gmail.com",
  password: "123123",
  first_name: "Frances",
  second_name: "Cheng",
  gender: "F",
  city: "Tokyo",
)


YUKA = User.create!(
  email: "yuka@gmail.com",
  password: "123123",
  first_name: "Yuka",
  second_name: "Takiyama",
  gender: "F",
  city: "Tokyo",
)

puts "Creating new products"
Product.create!(
  name: "Jeju Bija Anti Trouble Spot Essence",
  category: "Moisturizer",
  brand: "Innisfree",
  barcode: 999,
  description: " Formulated with Jeju bija oil 750mg, green complex (Jeju green tea, tangerine etc.) Relieves skin troubles and dermatitis and promotes vitality for skin. Fresh scent."
  )

puts "Creating new reviews"
Review.create!(
  title: "Can't live without it",
  content: "This is my desert island, can't live without it product. My skin loves it!",
  rating: 5,
  user: YUKA,
  product: Product.first
  )

ProductsIngredient.create!(
  product: Product.first,
  ingredient: Ingredient.first
  )
puts "All complete"





#iterate through "ingredient_list", find the ingredient that matches the name
#assign the ingredient to the product
#
# Product_ingredient.create!(product_id: 1, ingredient_id.find_by(name: ))

