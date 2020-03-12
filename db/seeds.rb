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
# puts "destroying flags"
# Flag.destroy_all
# Ingredient.destroy_all
# puts "Ingredients destroyed"
# puts "destroying reviews"
# Review.destroy_all
# Product.destroy_all
# puts "destroying users"
# User.destroy_all

#rails g task Model action (create all) (rake task)
#heroku run rails flag:create_all

#frances find_by email, unless frances, create user

frances = User.find_by(email: "frances@gmail.com")
unless frances
  frances = User.create!(
    email: "frances@gmail.com",
    password: "123123",
    first_name: "Frances",
    second_name: "Cheng",
    gender: "F",
    city: "Tokyo",
  )
end

unless frances.photo.attached?
  frances.photo.attach(io: File.open('app/assets/images/frances.jpg'), filename: 'frances.jpg', content_type: 'image/jpg')
end

yuka = User.find_by(email: "yuka@gmail.com")
unless yuka
    yuka = User.create!(
    email: "yuka@gmail.com",
    password: "123123",
    first_name: "Yuka",
    second_name: "Takiyama",
    gender: "F",
    city: "Tokyo",
  )
end

unless yuka.photo.attached?
  yuka.photo.attach(io: File.open('app/assets/images/avatar.jpg'), filename: 'avatar.jpg', content_type: 'image/jpg')
end

CATEGORIES = ["Cleanser", "Exfoliator", "Treatment", "Serum", "Face Oil", "Sunscreen", "Moisturizer", "Chemical Peel", "Toner", "Face Mask", "Eye Cream"]

puts "find or create products"
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
      ProductsIngredient.create(ingredient: ingredient, product: new_product)
    end
  end
end

product0 = Product.find_or_create_by!(
  name: "Ultra-Moisturising Hand Therapy, Lavender, 0.9 oz",
  category: "Moisturizer",
  brand: "Crabtree & Evelyn",
  barcode: "0044936274975",
  description: "Our award-winning shea butter hand cream with lavender oil leaves your hands feeling incredibly smooth and soft. Absorbing deep into the skin and leaving no greasy residue, our naturally formulated Lavender Hand Therapy in a tube is ideal for travel and on the go daily treatment and care."
  )

unless product0.photo.attached?
  product0.photo.attach(io: File.open('app/assets/images/lavender.jpg'), filename: 'lavender.jpg', content_type: 'image/jpg')
end

ingredients0 = %w(Water Macadamia\ Ternifolia\ Seed\ Oil Zea\ Mays\ (Corn)\ Starch Hydroxyethyl\ Urea Cetearyl\ Alcohol Stearic\ Acid Cetyl\ Alcohol Parfum\ (Fragrance) Butyrospermum\ Parkii\ (Shea)\ Butter Isopropyl\ Myristate Lippia\ Citriodora\ (Lemon\ Verbena)\ Flower\ Extract Lavandula\ Angustifolia\ (Lavender) Flower/Leaf/Stem Extract Commiphora Myrrha\ (Myrrh)\ Resin\ Extract Ceramide\ NP Ceramide\ AP Ceramide\ EOP Caprylic/Capric\ Triglyceride Saccharide\ Isomerate Polysorbate\ 60 Sucrose\ Stearate Arginine Dimethicone Sucrose\ Tristearate Behentrimonium\ Methosulfate Caprylyl\ Methicone Glycerin Sodium\ Lauroyl Lactylate Benzoic\ Acid Disodium\ EDTA Limonene Polysorbate\ 20 Ethylhexylglycerin Glycereth-2\ Cocoate Citronellol Hydroxycitronellal Citral Coumarin Linalool Butylene\ Glycol Citric\ Acid Sodium\ Citrate Cholesterol Phytosphingosine Carbomer Xanthan\ Gum Geraniol Lecithin Potassium\ Sorbate Sodium\ Benzoate Caprylyl\ Glycol Hyaluronic\ Acid Hydrolyzed\ Soy\ Protein Hexylene\ Glycol Ascorbyl\ Glucoside Tocotrienols Tocopherol Elaeis\ Guineensis (Palm)\ Oil Phenoxyethanol Squalane)

ingredients0.each do |ingredient|
  ingredient.downcase!
  ing_name = Ingredient.find_or_create_by!(name: ingredient)
  ProductsIngredient.create(product: product0, ingredient: ing_name)
end

product1 = Product.find_or_create_by!(
  name: "Moisturizing Milk",
  category: "Moisturizer",
  brand: "MUJI",
  barcode: "4550182202236",
  description: "Skin care series made using natural water from Kamaishi in Iwate prefecture. Provides fresh hydration for sensitive skin that dries easily. Low-irritation, making it gentle on delicate skin. ・Fragrance free・Artificial color free,・Mineral oil free・Mildly acidic ・Paraben-free・Alcohol free・allergy tested (This does not mean that the product does not cause allergy to anyone) ◎how to use：After using toner, take an appropriate amount on your hand, and apply thoroughly on your face."
  )

unless product1.photo.attached?
  product1.photo.attach(io: File.open('app/assets/images/muji.jpg'), filename: 'muji.jpg', content_type: 'image/jpg')
end

ingredients1 = %w(Water Olive\ Fruit\ Oil Dipropylene\ Glycol Glycerin PEG-32 Ethylhexyl\ Palmitate Pentylene\ Glycol Glycosyl\ Trehalose Glyceryl\ Stearate Jojoba\ Seed\ Oil Hydrolysate PEG-75\ Stearate Behenyl\ Alcohol Polysorbate\ 80 Phenoxyethanol Carbomer Arginine Butylene\ Glycol Allantoin Xanthan\ Gum Tocopherol Tetrasodium\ Etidronate Polyquaternium-51 Grapefruit\ Seed\ Extract Purslane\ Extract)

ingredients1.each do |ingredient|
  ingredient.downcase!
  ing_name = Ingredient.find_or_create_by!(name: ingredient)
  ProductsIngredient.create(product: product1, ingredient: ing_name)
end

product2 = Product.find_or_create_by!(
  name: "CRÈME MAINS LAVANDE 30 ML",
  category: "Moisturizer",
  brand: "L'OCCITANE",
  barcode: "3253581207031",
  description: "Rich in grape seed oil, the Verbena Body Milk moisturizes * and nourishes the epidermis. Thanks to the Verbena extract, it softens the skin leaving a light scented veil. * upper layers of the epidermis."
  )


  product2.photo.attach(io: File.open('app/assets/images/loccitane.jpg'), filename: 'loccitane.jpg', content_type: 'image/jpg')


ingredients2 = %w(AQUA/WATER GLYCERIN BUTYROSPERMUM\ PARKII\ (SHEA)\ BUTTER CETEARYL\ ALCOHOL VITIS\ VINIFERA\ (GRAPE)\ SEED\ OIL DICAPRYLYL\ CARBONATE HYDROXYETHYL\ ACRYLATE/SODIUM\ ACRYLOYLDIMETHYL\ TAURATE\ COPOLYMER CETYL\ ALCOHOL DIMETHICONE LAVANDULA\ ANGUSTIFOLIA\ (LAVENDER)\ OIL COCOS\ NUCIFERA\ (COCONUT)\ OIL CERA\ ALBA\ (BEESWAX) HELIANTHUS\ ANNUUS\ (SUNFLOWER)\ SEED\ OIL ROSMARINUS\ OFFICINALIS\ (ROSEMARY)\ LEAF\ EXTRACT CETEARYL\ GLUCOSIDE TOCOPHEROL POLYSORBATE\ 60 SORBITAN\ ISOSTEARATE PHENOXYETHANOL CORN\ STARCH\ MODIFIED CHLORPHENESIN PARFUM/FRAGRANCE XANTHAN\ GUM ETHYLHEXYLGLYCERIN COUMARIN LINALOOL LIMONENE GERANIOL)

ingredients2.each do |ingredient|
  ingredient.downcase!
  ing_name = Ingredient.find_or_create_by!(name: ingredient)
  ProductsIngredient.create(product: product2, ingredient: ing_name)
end

puts "Find or create new reviews"

review_attributes = [
  {
    title: "Overpriced",
    content: "L'Occitane has some stunning products. Sadly, they are overpriced as you pay for the brand. This hand cream is no exception. Thankfully, I received it as a gift! It is a lightweight formula, which absorbs easily into the skin and has a clean smell (which reminds me of baby products). Personally, there are cheaper hand creams on the market which contain shea butter or are more moisturising, for half the price. Palmer's Lotion has a lovely coconut oil hand cream - which is extremely nourishing, but sometimes a bit greasy. The Body Shop has a shea butter hand cream - which is light, smells fresh and clean (which you can buy in the same sizes, for almost 1/3 of the price). Pros - Smells great (clean &amp; fresh) - Lightweight Cons - Expensive - Not very moisturising",
    rating: 2,
    user: yuka,
    product: product2
  },
  {
    title: "Wonderful for sensitive skin!",
    content: "I cannot rave enough about this moisturizer! I have incredibly sensitive combination skin. I have tried so many different products. And then I saw Gothamista recommend this in one of her best affordable products videos. I am so glad that I took a chance! My skin feels so much better and I'm no longer as irritated. It's so gentle I can even use it on my eyes. For me, this is a must have.",
    rating: 5,
    user: yuka,
    product: product1
  }
]

review_attributes.each do |hash|
  Review.find_or_create_by!(hash)
end

puts "finding or creating tags"

# frances.tag_list = "sensitive skin, oily skin, dry skin, allergens/irritants, reproductive toxicity, environmental concerns, preservatives, parabens, fragrance"
# frances.save
# frances.reload

lavender = Ingredient.find_by(name: "lavandula angustifolia (lavender)")
lavender.tag_list = "bad for sensitive skin"
lavender.save

lavender_oil = Ingredient.find_by(name: "lavandula angustifolia (lavender) oil")
lavender_oil.tag_list = "bad for sensitive skin"
lavender_oil.save

# Flag.find_or_create_by!(ingredient: lavender, user: frances)

bad_for_oily_ingredients = []
bad_for_oily_ingredients << Ingredient.find_by(name: "zea mays (corn) starch")
bad_for_oily_ingredients << Ingredient.find_by(name: "stearic acid")
bad_for_oily_ingredients << Ingredient.find_by(name: "butyrospermum parkii (shea) butter")

bad_for_oily_ingredients.each do |ingredient|
  ingredient.tag_list.add("bad for oily skin")
  ingredient.save
  # Flag.find_or_create_by!(ingredient: ingredient, user: frances)
end


good_for_sensitive_ingredients = []
good_for_sensitive_ingredients << Ingredient.find_by(name: "cocos nucifera (coconut) oil")
good_for_sensitive_ingredients << Ingredient.find_by(name: "allantoin")

good_for_sensitive_ingredients.each do |ingredient|
  ingredient.tag_list.add("good for sensitive skin")
  ingredient.save
  # Flag.find_or_create_by!(ingredient: ingredient, user: frances)
end

# good_for_sensitive_ingredient = Ingredient.find_by(name: "cocos nucifera (coconut) oil")
# good_for_sensitive_ingredient.tag_list.add("good for sensitive skin")
# good_for_sensitive_ingredient.save

mask = Product.find_by(name: "moisture bond sleeping recovery masque")
toner = Product.find_by(name: "don't worry bee care calendula toner")
foam = Product.find_by(name: "treatment cleansing foam")
bee = Product.find_by(name: "snail bee high content lotion")
snail = Product.find_by(name: "urban dollkiss snail therapy sleeping pack")

frances_liked = [mask, toner, foam, bee, snail]

frances_liked.each do |product|
  frances.likes product
end

unless mask.photo.attached?
  mask.photo.attach(io: File.open("app/assets/images/mask.jpg"), filename: 'mask.jpg', content_type: 'image/jpg')
end

unless toner.photo.attached?
  toner.photo.attach(io: File.open("app/assets/images/toner.jpg"), filename: 'toner.jpg', content_type: 'image/jpg')
end

unless foam.photo.attached?
  foam.photo.attach(io: File.open("app/assets/images/foam.jpg"), filename: 'foam.jpg', content_type: 'image/jpg')
end

unless bee.photo.attached?
  bee.photo.attach(io: File.open("app/assets/images/bee.jpg"), filename: 'bee.jpg', content_type: 'image/jpg')
end

unless snail.photo.attached?
  snail.photo.attach(io: File.open("app/assets/images/snail.jpg"), filename: 'snail.jpg', content_type: 'image/jpg')
end

# photoes to products (by Hiro)
white = Product.find_by(name: "white pore facial cleanser")
wonder = Product.find_by(name: "wonder pore deep foaming cleanser")
green_tea = Product.find_by(name: "the green tea seed oil")
rice_water = Product.find_by(name: "rice water cleansing oil")
# strawberry = Product.find_by(name: "strawberry face scrub")
creamy = Product.find_by(name: "creamy deep moist moisturizer")
oil = Product.find_by(name: "oil control fresh moisturizer")
priming = Product.find_by(name: "priming moisturizer")
ac_clinic = Product.find_by(name: "ac clinic daily toner")
aloe = Product.find_by(name: "aloe bha skin toner")
super_aqua = Product.find_by(name: "super aqua hydrating toner")

yuka_liked = [white, wonder, green_tea, rice_water, creamy, oil, priming, ac_clinic, aloe, super_aqua]

yuka_liked.each do |product|
  yuka.likes product
end

unless white.photo.attached?
  white.photo.attach(io: File.open("app/assets/images/seed_photos/cleanser/white.jpg"), filename: 'white.jpg', content_type: 'image/jpg')
end

unless wonder.photo.attached?
  wonder.photo.attach(io: File.open("app/assets/images/seed_photos/cleanser/wonder.jpg"), filename: 'wonder.jpg', content_type: 'image/jpg')
end

unless green_tea.photo.attached?
  green_tea.photo.attach(io: File.open("app/assets/images/seed_photos/face_oil/green_tea.jpg"), filename: 'green_tea.jpg', content_type: 'image/jpg')
end

unless rice_water.photo.attached?
  rice_water.photo.attach(io: File.open("app/assets/images/seed_photos/face_oil/rice_water.jpg"), filename: 'rice_water.jpg', content_type: 'image/jpg')
end

unless creamy.photo.attached?
  creamy.photo.attach(io: File.open("app/assets/images/seed_photos/moisturizer/creamy.jpg"), filename: 'creamy.jpg', content_type: 'image/jpg')
end

unless oil.photo.attached?
  oil.photo.attach(io: File.open("app/assets/images/seed_photos/moisturizer/oil.jpg"), filename: 'oil.jpg', content_type: 'image/jpg')
end

unless priming.photo.attached?
  priming.photo.attach(io: File.open("app/assets/images/seed_photos/moisturizer/priming.jpg"), filename: 'priming.jpg', content_type: 'image/jpg')
end

unless ac_clinic.photo.attached?
  ac_clinic.photo.attach(io: File.open("app/assets/images/seed_photos/toner/ac_clinic.jpg"), filename: 'ac_clinic.jpg', content_type: 'image/jpg')
end

unless aloe.photo.attached?
  aloe.photo.attach(io: File.open("app/assets/images/seed_photos/toner/aloe.jpg"), filename: 'aloe.jpg', content_type: 'image/jpg')
end

unless super_aqua.photo.attached?
  super_aqua.photo.attach(io: File.open("app/assets/images/seed_photos/toner/super_aqua.jpg"), filename: 'super_aqua.jpg', content_type: 'image/jpg')
end

#related products to Muji/L'OCCITAN

anti_blemish = Product.find_by(name: "base toner ph 5.6")
treatment_cleansing = Product.find_by(name: "aloe vera oil-free moisture cream")
powder_wash = Product.find_by(name: "natural bha skin returning emulsion")
time_response = Product.find_by(name: "geo wrinkle care gold cream")

unless anti_blemish.photo.attached?
  anti_blemish.photo.attach(io: File.open("app/assets/images/seed_photos/related_products/anti_blemish.jpg"), filename: 'anti_blemish.jpg', content_type: 'image/jpg')
end

unless treatment_cleansing.photo.attached?
  treatment_cleansing.photo.attach(io: File.open("app/assets/images/seed_photos/related_products/treatment_cleansing.jpg"), filename: 'treatment_cleansing.jpg', content_type: 'image/jpg')
end

unless powder_wash.photo.attached?
  powder_wash.photo.attach(io: File.open("app/assets/images/seed_photos/related_products/powder_wash.jpg"), filename: 'powder_wash.jpg', content_type: 'image/jpg')
end

unless time_response.photo.attached?
  time_response.photo.attach(io: File.open("app/assets/images/seed_photos/related_products/time_response.jpg"), filename: 'time_response.jpg', content_type: 'image/jpg')
end

puts "All complete"
