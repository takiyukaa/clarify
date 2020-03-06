# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'open-uri'

# ProductsIngredient.destroy_all
puts "destroying flags"
Flag.destroy_all
# Ingredient.destroy_all
# puts "Ingredients destroyed"
puts "destroying reviews"
Review.destroy_all
# Product.destroy_all
puts "destroying users"
User.destroy_all
# puts "Products and reviews destroyed"

frances = User.create!(
  email: "frances@gmail.com",
  password: "123123",
  first_name: "Frances",
  second_name: "Cheng",
  gender: "F",
  city: "Tokyo",
)

frances.photo.attach(io: File.open('app/assets/images/frances.jpg'), filename: 'frances.jpg', content_type: 'image/jpg')


yuka = User.create!(
  email: "yuka@gmail.com",
  password: "123123",
  first_name: "Yuka",
  second_name: "Takiyama",
  gender: "F",
  city: "Tokyo",
)

yuka.photo.attach(io: File.open('app/assets/images/avatar.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')


product0 = Product.find_or_create_by!(
  name: "Ultra-Moisturising Hand Therapy, Lavender, 0.9 oz",
  category: "Moisturizer",
  brand: "Crabtree & Evelyn",
  barcode: "0044936274975",
  description: "Our award-winning shea butter hand cream with lavender oil leaves your hands feeling incredibly smooth and soft. Absorbing deep into the skin and leaving no greasy residue, our naturally formulated Lavender Hand Therapy in a tube is ideal for travel and on the go daily treatment and care."
  )

product0.photo.attach(io: File.open('app/assets/images/lavender.jpg'), filename: 'lavender.jpg', content_type: 'image/jpg')

ingredients0 = %w(Water Macadamia\ Ternifolia\ Seed\ Oil Zea\ Mays\ (Corn)\ Starch Hydroxyethyl\ Urea Cetearyl\ Alcohol Stearic\ Acid Cetyl\ Alcohol Parfum\ (Fragrance) Butyrospermum\ Parkii\ (Shea)\ Butter Isopropyl\ Myristate Lippia\ Citriodora\ (Lemon\ Verbena)\ Flower\ Extract Lavandula\ Angustifolia\ (Lavender) Flower/Leaf/Stem Extract Commiphora Myrrha\ (Myrrh)\ Resin\ Extract Ceramide\ NP Ceramide\ AP Ceramide\ EOP Caprylic/Capric\ Triglyceride Saccharide\ Isomerate Polysorbate\ 60 Sucrose\ Stearate Arginine Dimethicone Sucrose\ Tristearate Behentrimonium\ Methosulfate Caprylyl\ Methicone Glycerin Sodium\ Lauroyl Lactylate Benzoic\ Acid Disodium\ EDTA Limonene Polysorbate\ 20 Ethylhexylglycerin Glycereth-2\ Cocoate Citronellol Hydroxycitronellal Citral Coumarin Linalool Butylene\ Glycol Citric\ Acid Sodium\ Citrate Cholesterol Phytosphingosine Carbomer Xanthan\ Gum Geraniol Lecithin Potassium\ Sorbate Sodium\ Benzoate Caprylyl\ Glycol Hyaluronic\ Acid Hydrolyzed\ Soy\ Protein Hexylene\ Glycol Ascorbyl\ Glucoside Tocotrienols Tocopherol Elaeis\ Guineensis (Palm)\ Oil Phenoxyethanol Squalane)

ingredients0.each do |ingredient|
  ingredient.downcase!
  ing_name = Ingredient.find_or_create_by!(name: ingredient)
  ProductsIngredient.find_or_create_by!(product: product0, ingredient: ing_name)
end

product1 = Product.find_or_create_by!(
  name: "Moisturizing Milk",
  category: "Moisturizer",
  brand: "MUJI",
  barcode: "4550182202236",
  description: "Skin care series made using natural water from Kamaishi in Iwate prefecture. Provides fresh hydration for sensitive skin that dries easily. Low-irritation, making it gentle on delicate skin. ・Fragrance free・Artificial color free,・Mineral oil free・Mildly acidic ・Paraben-free・Alcohol free・allergy tested (This does not mean that the product does not cause allergy to anyone) ◎how to use：After using toner, take an appropriate amount on your hand, and apply thoroughly on your face."
  )

product1.photo.attach(io: File.open('app/assets/images/muji.jpg'), filename: 'muji.jpg', content_type: 'image/jpg')

ingredients1 = %w(Water Olive\ Fruit\ Oil Dipropylene\ Glycol Glycerin PEG-32 Ethylhexyl\ Palmitate Pentylene\ Glycol Glycosyl\ Trehalose Glyceryl\ Stearate Jojoba\ Seed\ Oil Hydrolysate PEG-75\ Stearate Behenyl\ Alcohol Polysorbate\ 80 Phenoxyethanol Carbomer Arginine Butylene\ Glycol Allantoin Xanthan\ Gum Tocopherol Tetrasodium\ Etidronate Polyquaternium-51 Grapefruit\ Seed\ Extract Purslane\ Extract)

ingredients1.each do |ingredient|
  ingredient.downcase!
  ing_name = Ingredient.find_or_create_by!(name: ingredient)
  ProductsIngredient.find_or_create_by!(product: product1, ingredient: ing_name)
end

CATEGORIES = ["Cleanser", "Exfoliator", "Treatment", "Serum", "Face Oil", "Sunscreen", "Moisturizer", "Chemical Peel", "Toner", "Face Mask", "Eye Cream"]

puts "Creating new reviews"

review_attributes = [
  {
    title: "I am disappointed that Crabtree & Evelyn discontinued the Lavender Hand Therapy",
    content: "The new Lavender's fragrance is much too strong for me. I can't tell that it has lavender in it. The only reason I gave it a second star was that the rich, non-greasy texture is the same. Unfortunately, the strong, masculine fragrance is not to my liking.",
    rating: 5,
    user: yuka,
    product: product0
  },
  {
    title: "Wonderful for sensitive skin!",
    content: "I cannot rave enough about this moisturizer! I have incredibly sensitive combination skin. I have tried so many different products. And then I saw Gothamista recommend this in one of her best affordable products videos. I am so glad that I took a chance! My skin feels so much better and I'm no longer as irritated. It's so gentle I can even use it on my eyes. For me, this is a must have.",
    rating: 5,
    user: yuka,
    product: product1
  }
]

Review.create!(review_attributes)

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

frances.tag_list = "sensitive skin, oily skin"
frances.save
frances.reload

lavender = Ingredient.find_by(name: "lavandula angustifolia (lavender)")
lavender.tag_list.add("sensitive skin")

Flag.create!(ingredient: lavender, user: frances)

oily_ingredients = []
oily_ingredients << Ingredient.find_by(name: "zea mays (corn) starch")
oily_ingredients << Ingredient.find_by(name: "stearic acid")
oily_ingredients << Ingredient.find_by(name: "butyrospermum parkii (shea) butter")

oily_ingredients.each do |ingredient|
  ingredient.tag_list.add("oily skin")
  Flag.create!(ingredient: ingredient, user: frances)
end

mask = Product.find_by(name: "moisture bond sleeping recovery masque")
toner = Product.find_by(name: "don't worry bee care calendula toner")
foam = Product.find_by(name: "treatment cleansing foam")
bee = Product.find_by(name: "snail bee high content lotion")
snail = Product.find_by(name: "urban dollkiss snail therapy sleeping pack")

frances_liked = [mask, toner, foam, bee, snail]

frances_liked.each do |product|
  frances.likes product
end

mask.photo.attach(io: File.open("app/assets/images/mask.jpg"), filename: 'mask.jpg', content_type: 'image/jpg')
toner.photo.attach(io: File.open("app/assets/images/toner.jpg"), filename: 'toner.jpg', content_type: 'image/jpg')
foam.photo.attach(io: File.open("app/assets/images/foam.jpg"), filename: 'foam.jpg', content_type: 'image/jpg')
bee.photo.attach(io: File.open("app/assets/images/bee.jpg"), filename: 'bee.jpg', content_type: 'image/jpg')
snail.photo.attach(io: File.open("app/assets/images/snail.jpg"), filename: 'snail.jpg', content_type: 'image/jpg')

puts "All complete"
