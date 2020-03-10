namespace :review do
  desc "create users with reviews for the green tea seed oil"
  task create_green_reviews: :environment do

    USERS = []

    PHOTOS_URLS_2 = [ "https://avatars0.githubusercontent.com/u/58677059?s=400&v=4",
      "https://avatars0.githubusercontent.com/u/59574812?s=400&v=4",
      "https://avatars3.githubusercontent.com/u/58992961?s=400&v=4",
      "https://avatars0.githubusercontent.com/u/40887017?s=400&v=4"
    ]

    count = 1

    PHOTOS_URLS_2.each do |url|
      user = User.create!(
        email: "clarify#{count}@gmail.com",
        password: "123123",
        first_name: Faker::Name.first_name,
        second_name: Faker::Name.last_name,
        gender: "F",
        city: "Tokyo",
        )

      file = URI.open(url)
      user.photo.attach(io: file, filename: 'user.jpg', content_type: 'image/jpg')

      USERS << user

      count += 1
    end

    green = Product.find_by(name: "the green tea seed oil")
    green.description = "This anti-oxidant moisturizing oil, formulated with eco-friendly jeju green tea seeds, replenishes moisture and nutrients from deep within your skin. Green tea seeds that blossom in autumn to bear the abundant energy of all four seasons deliver moisture and nutrients deep into skin layers to intensively retain moisture from deep within the skin."


    TITLES = ["Perfectly nourishing to skin", "This stuff is great! Light and watery which absorbs really quickly", "Best hydrating product out there! Game Changer!", "Amazing product" ]

    CONTENTS = ["Great product. Helped me clear up in days after years of acne. I use it after cleansing with a hypoallergenic facial cleanser and toner. Yeah I’m a guy and use toner ik. Anyways works great and i get questions on how it happened.", "This stuff is great! Light and watery which absorbs really quickly. The smell is strong but it's very herbal not perfumey and dissipates immediately. It's light enough to wear under your moisturizer before makeup. I use it morning and night and have seen improvements already. I stopped using retinols so my skin is still recovering, this stuff is really soothing without being overly oily or greasy. I will definitely be buying this again.", "I absolutely LOVE LOVE LOVE this product!!! My favorite product that I have tried from this brand thus far. Extremely hydrating and rejuvenating. I also love that it is light weight and not greasy or sticky at all. Absorbs into the skin very well. Leaves my skin feeling very fresh and moisturized. Will be ordering this for the rest of my life!", "Very nourishing & moisturizing. Great after toner and before applying your favorite moisturizer. I would highly recommend the product. Fragrance free which is ideal for all skincare products. Fragrance has no benefits to skin except to irritate or make my face red and sensitive."]


    review_count = 0

    USERS.each do |user|
      Review.create!({
        title: TITLES[review_count],
        content: CONTENTS[review_count],
        rating: Random.rand(4..5),
        user: user,
        product: green
      }
      )
      review_count += 1
    end

  end

end
