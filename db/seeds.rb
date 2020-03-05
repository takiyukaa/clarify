# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'open-uri'

Flag.destroy_all
puts "All users destroyed"
Review.destroy_all
User.destroy_all
puts "Products and reviews destroyed"

# # puts "Creating new ingredients"
# # result = RestClient.get 'https://skincare-api.herokuapp.com/ingredients'

# # result_array = JSON.parse(result)[0..50]

# # result_array.each do |hash|
# #   Ingredient.create!(name: hash["ingredient"])
# # end

# puts "Creating new users"

frances = User.create!(
  email: "frances@gmail.com",
  password: "123123",
  first_name: "Frances",
  second_name: "Cheng",
  gender: "F",
  city: "Tokyo",
)
francesfile = URI.open('https://res.cloudinary.com/dopoqpdhm/image/upload/v1582878432/fZLeDeZpZcXvzjBWUmXNqCDu.jpg')
frances.photo.attach(io: francesfile, filename: 'fZLeDeZpZcXvzjBWUmXNqCDu.jpg', content_type: 'image/jpg')

yuka = User.create!(
  email: "yuka@gmail.com",
  password: "123123",
  first_name: "Yuka",
  second_name: "Takiyama",
  gender: "F",
  city: "Tokyo",
)

yukafile = URI.open('https://res.cloudinary.com/dopoqpdhm/image/upload/v1582878427/iSnsb4vKmwU7se6BsXxxzu8u.jpg')
yuka.photo.attach(io: yukafile, filename: 'yuka.jpg', content_type: 'image/jpg')

puts "Creating new products"

product0 = Product.create!(
  name: "Ultra-Moisturising Hand Therapy, Lavender, 0.9 oz",
  category: "Moisturizer",
  brand: "Crabtree & Evelyn",
  barcode: "044936274975",
  description: "Our award-winning shea butter hand cream with lavender oil leaves your hands feeling incredibly smooth and soft. Absorbing deep into the skin and leaving no greasy residue, our naturally formulated Lavender Hand Therapy in a tube is ideal for travel and on the go daily treatment and care."
  )

product1 = Product.create!(
  name: "Moisturizing Milk",
  category: "Moisturizer",
  brand: "MUJI",
  barcode: "4550182202236",
  description: "Skin care series made using natural water from Kamaishi in Iwate prefecture. Provides fresh hydration for sensitive skin that dries easily. Low-irritation, making it gentle on delicate skin. ・Fragrance free・Artificial color free,・Mineral oil free・Mildly acidic ・Paraben-free・Alcohol free・allergy tested (This does not mean that the product does not cause allergy to anyone) ◎how to use：After using toner, take an appropriate amount on your hand, and apply thoroughly on your face. "
  )

# product2 = Product.create!(
#     name: "Jeju Bija Anti Trouble Spot Essence",
#     category: "Moisturizer",
#     brand: "Innisfree",
#     barcode: 999,
#     description: "Formulated with Jeju bija oil 750mg, green complex (Jeju green tea, tangerine etc.) Relieves skin troubles and dermatitis and promotes vitality for skin. Fresh scent."
#   )

# product3 = Product.create!(
#     name: "Bio-enzyme Refining Complex Self-activating Skin Polisher",
#     category: "Exfoliator",
#     brand: "Amore Pacific",
#     barcode: 111,
#     description: "Increases skin's cell turnover and purges skin of toxins to reveal smoother, radiant, youthful, healthy-looking skin. Works with skin's own enzymes to reduce inflammation and redness "
#     )


# product4 = Product.create!(
#     name: "SNAIL BEE HIGH CONTENT ESSENCE",
#     category: "Supplement",
#     brand: "Benton",
#     barcode: 222,
#     description: "Snail Secretion filtrate is not sticky in texture, it is watery texture close to water's normal texture, instead of water, snail secretion filtrate was used. Even a small amount of stimulating chemical ingredient could be critical to our skin. when the skin could no longer with hold the stimulation, the skin may tend to produce break outs. Snail BEE High Content Essence is a moisturizing essence which does not contain artificial ingredients that enhance stickiness."
#     )

CATEGORIES = ["Cleanser", "Exfoliator", "Treatment", "Serum", "Face Oil", "Sunscreen", "Moisturizer", "Chemical Peel", "Toner", "Face Mask", "Eye Cream"]

# skincare = RestClient.get 'https://skincare-api.herokuapp.com/products'

# skincare_array = JSON.parse(skincare)[50..55]

# start = 1

# skincare_array.each do |hash|
#   Product.create!(
#     name: hash["name"],
#     category: CATEGORIES.sample,
#     brand: hash["brand"],
#     barcode: start,
#     description: "Add a description for this product"
#     )
#   start += 1
# end

# puts "Creating new reviews"

review_attributes = [
{
  title: "I really love this spot treatment",
  content: "I always have trouble with spot treatments being too strong to the point where they would burn or leave a scar. This one doesn't do that to me, it seems very gentle. It doesn't work as fast, but i love how nicely spots where there was acne heal. There has been way less scarring and pigmentation changes that I have had to deal with while using other products. I can deal with the slower time, especially with the awesome payoff for my skin!",
  rating: 5,
  user: yuka,
  product: product0
},
{
  title: "Can't live without it",
  content: "This is my desert island, can't live without it product. My skin loves it!",
  rating: 5,
  user: frances,
  product: product1
}
]

Review.create!(review_attributes)

## Ingredient.all.each do |ingredient|
##   ProductsIngredient.create!(ingredient: ingredient, product: Product.all.sample)
## end

# puts "Creating new ingredients"
api = RestClient.get 'https://skincare-api.herokuapp.com/products'

products = JSON.parse(api)

if Product.all.count < 100
  products.each do |product|
    new_product = Product.create!(
    name: product["name"],
    brand: product["brand"],
    category: CATEGORIES.sample,
    description: "Add a description for this product"
    )
    product["ingredient_list"].each do |ingredient_name|
      ingredient = Ingredient.find_or_create_by!(name: ingredient_name)
      ProductsIngredient.create!(ingredient: ingredient, product: new_product)
    end
  end
end

# tags = ["parabens", "fragrance", "sensitizing", ]

# parabens = RestClient.get 'https://skincare-api.herokuapp.com/ingredient?q=paraben'
# fragrance =

# result_array.each do |hash|
#   Ingredient.create!(name: hash["ingredient"])
# end
# frances_ing = ["methylparaben", "propylparaben", "fragrance"]

# frances_flags = [
# {
#   user: frances,
#   ingredient:
# }
# ]
# 3.times do
#   Flag.create!(
#     user: frances,
#   )
# end

# 10.times do
#   Flag.create!(
#     user: yuka,
#     ingredient: Ingredient.all.sample
#   )
# end



puts "All complete"





#iterate through "ingredient_list", find the ingredient that matches the name
#assign the ingredient to the product
#
# Product_ingredient.create!(product_id: 1, ingredient_id.find_by(name: ))

