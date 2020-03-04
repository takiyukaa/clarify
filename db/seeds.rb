# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'open-uri'

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
francesfile = URI.open('https://res.cloudinary.com/dopoqpdhm/image/upload/v1582878432/fZLeDeZpZcXvzjBWUmXNqCDu.jpg')
FRANCES.photo.attach(io: francesfile, filename: 'fZLeDeZpZcXvzjBWUmXNqCDu.jpg', content_type: 'image/jpg')

YUKA = User.create!(
  email: "yuka@gmail.com",
  password: "123123",
  first_name: "Yuka",
  second_name: "Takiyama",
  gender: "F",
  city: "Tokyo",
)

yukafile = URI.open('https://res.cloudinary.com/dopoqpdhm/image/upload/v1582854470/yuka.jpg')
YUKA.photo.attach(io: yukafile, filename: 'yuka.jpg', content_type: 'image/jpg')

puts "Creating new products"


product1 = Product.create!(
    name: "Jeju Bija Anti Trouble Spot Essence",
    category: "Moisturizer",
    brand: "Innisfree",
    barcode: 999,
    description: "Formulated with Jeju bija oil 750mg, green complex (Jeju green tea, tangerine etc.) Relieves skin troubles and dermatitis and promotes vitality for skin. Fresh scent."
  )
photo1 = URI.open('https://res.cloudinary.com/dopoqpdhm/image/upload/v1582854043/hiro.jpg')
HIRO.photo.attach(io: hirofile, filename: 'hiro.jpg', content_type: 'image/jpg')

product2 = Product.create!(
    name: "Bio-enzyme Refining Complex Self-activating Skin Polisher",
    category: "Exfoliator",
    brand: "Amore Pacific",
    barcode: 111,
    description: "Increases skin's cell turnover and purges skin of toxins to reveal smoother, radiant, youthful, healthy-looking skin. Works with skin's own enzymes to reduce inflammation and redness "
    )


product3 = Product.create!(
    name: "SNAIL BEE HIGH CONTENT ESSENCE",
    category: "Supplement",
    brand: "Benton",
    barcode: 222,
    description: "Snail Secretion filtrate is not sticky in texture, it is watery texture close to water's normal texture, instead of water, snail secretion filtrate was used. Even a small amount of stimulating chemical ingredient could be critical to our skin. when the skin could no longer with hold the stimulation, the skin may tend to produce break outs. Snail BEE High Content Essence is a moisturizing essence which does not contain artificial ingredients that enhance stickiness."
    )

CATEGORIES = ["Cleanser", "Exfoliator", "Treatment", "Serum", "Face Oil", "Sunscreen", "Moisturizer", "Chemical Peel", "Toner", "Face Mask", "Eye Cream"]

skincare = RestClient.get 'https://skincare-api.herokuapp.com/product'

skincare_array = JSON.parse(skincare)[100..105]

start = 1

skincare_array.each do |hash|
  Product.create!(
    name: hash["name"],
    category: CATEGORIES.sample,
    brand: hash["brand"],
    barcode: start,
    description: "Add a description for this product"
    )
  start += 1
end

puts "Creating new reviews"

review_attributes = [
{
  title: "I really love this spot treatment",
  content: "I always have trouble with spot treatments being too strong to the point where they would burn or leave a scar. This one doesn't do that to me, it seems very gentle. It doesn't work as fast, but i love how nicely spots where there was acne heal. There has been way less scarring and pigmentation changes that I have had to deal with while using other products. I can deal with the slower time, especially with the awesome payoff for my skin!",
  rating: 5,
  user: YUKA,
  product: product1
},
{
  title: "Just ok",
  content: "Didn't really notice any effect on my skin, but my friends seem to love it",
  rating: 3,
  user: FRANCES,
  product: product2
},
{
  title: "Can't live without it",
  content: "This is my desert island, can't live without it product. My skin loves it!",
  rating: 5,
  user: YUKA,
  product: product3
}
]
Review.create!(review_attributes)

Ingredient.all.each do |ingredient|
  ProductsIngredient.create!(ingredient: ingredient, product: Product.all.sample)
end

puts "All complete"





#iterate through "ingredient_list", find the ingredient that matches the name
#assign the ingredient to the product
#
# Product_ingredient.create!(product_id: 1, ingredient_id.find_by(name: ))

