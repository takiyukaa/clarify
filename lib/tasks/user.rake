namespace :user do
  desc "create users and reviews"
  task create_user_reviews: :environment do

 Review.destroy_all

    USERS =[]
    PHOTOS_URLS= [ "https://avatars0.githubusercontent.com/u/21108437?s=400&v=4",
      "https://avatars0.githubusercontent.com/u/25542223?s=400&v=4",
      "https://avatars1.githubusercontent.com/u/56534210?s=400&v=4",
      "https://avatars0.githubusercontent.com/u/35246097?s=400&v=4",
      "https://avatars3.githubusercontent.com/u/42826652?s=400&v=4",
      "https://avatars3.githubusercontent.com/u/47935870?s=400&v=4",
      "https://avatars3.githubusercontent.com/u/31160338?s=400&v=4",
      "https://avatars0.githubusercontent.com/u/6465116?s=400&v=4",
      "https://avatars1.githubusercontent.com/u/26819547?s=400&v=4",
      "https://avatars0.githubusercontent.com/u/58544437?s=400&v=4",
      "https://avatars0.githubusercontent.com/u/25833282?s=400&v=4",
      "https://avatars0.githubusercontent.com/u/40887017?s=400&v=4",
      "https://avatars0.githubusercontent.com/u/59479470?s=400&v=4"
    ]

    PHOTOS_URLS.each do |url|
      user = User.create!(
        email: Faker::Internet.free_email,
        password: "123123",
        first_name: Faker::Name.first_name,
        second_name: Faker::Name.last_name,
        gender: "F",
        city: "Tokyo",
        )

      file = URI.open(url)
      user.photo.attach(io: file, filename: 'user.jpg', content_type: 'image/jpg')

      USERS << user
    end

    muji = Product.find_by(name: "Moisturizing Milk")
    evelyn = Product.find_by(name: "Ultra-Moisturising Hand Therapy, Lavender, 0.9 oz")
    # loccotane = Product.find_by(name: "CRÈME MAINS LAVANDE 30 ML")
    loccotane = Product.find_by(name: "CRÈME MAINS LAVANDE 30 ML")

    muji_attributes = [
      {
        title: "Great Moisturing Milk",
        content: "While it took a while to receive this I found the packing to be exceptional. They included a hand written card, tea bags and candy. The moisturising milk is great and I use this under my foundation.",
        rating: 5,
        user: USERS.sample,
        product: muji
      },
      {
        title: "Great quality",
        content: "Bought it as a recommendation from gothamista and love it. I have combo skin and it absorbs so good.",
        rating: 5,
        user: USERS.sample,
        product: muji
      },
      {
        title: "Love! Cooling, moisturizing",
        content: "This stuff is great. I have never loved putting on a moisturizer but I love putting on this. It's so cooling to my skin and makes it feel good. It's almost slippery at first but absorbs right in. It is not heavy enough to be my only night Cream so I use two. I am usually not a person who would use two products in the same category but I just like it so much. I'm 36 and would say I have normal skin. But if you are younger or have oily skin... this might be all you need.",
        rating: 5,
        user: USERS.sample,
        product: muji
      },
      {
        title: "Super moisturizing!!!",
        content: "The lotion arrived before the expected date. It works wonder for my dry skin in the winter. As a lotion, it has the lighter weight, is non greasy and absorbs faster than moisturizing cream. Definitely would buy it again.",
        rating: 5,
        user: USERS.sample,
        product: muji
      }
    ]

    muji_attributes.each do |hash|
      Review.find_or_create_by!(hash)
    end

    evelyn_attributes = [
      {
        title: "Not the best hand lotion",
        content: "Not the best hand lotion I've ever tried. I do like it, except it makes my hands feel very greasy for a long time. It seems kind of more expensive then aveeno which I prefer over this. I most likely won't buy it again",
        rating: 2,
        user: USERS.sample,
        product: evelyn
      },
      {
        title: "slightly sticky",
        content: "I love the scent. It's a pure smell of real lavender. The lotion has a slightly sticky feel and I don't care for that",
        rating: 2,
        user: USERS.sample,
        product: evelyn
      },
      {
        title: "too strong",
        content: "I like the scent but sometimes it's too strong. It also doesn't really do anything special for my skin. Average product.",
        rating: 3,
        user: USERS.sample,
        product: evelyn
      },
      {
        title: "A little expensive",
        content: "Love the smell and definitely leaves my hands super soft. A little expensive for my taste, but I keep buying it!",
        rating: 3,
        user: USERS.sample,
        product: evelyn
      }
    ]

    evelyn_attributes.each do |hash|
      Review.find_or_create_by!(hash)
    end

    loccotane_attributes = [
      {
        title: "Not the best hand lotion",
        content: "Not the best hand lotion I've ever tried. I do like it, except it makes my hands feel very greasy for a long time. It seems kind of more expensive then aveeno which I prefer over this. I most likely won't buy it again",
        rating: 2,
        user: USERS.sample,
        product: loccotane
      },
      {
        title: "slightly sticky",
        content: "I love the scent. It's a pure smell of real lavender. The lotion has a slightly sticky feel and I don't care for that",
        rating: 2,
        user: USERS.sample,
        product: loccotane
      },
      {
        title: "too strong",
        content: "I like the scent but sometimes it's too strong. It also doesn't really do anything special for my skin. Average product.",
        rating: 3,
        user: USERS.sample,
        product: loccotane
      },
      {
        title: "A little expensive",
        content: "Love the smell and definitely leaves my hands super soft. A little expensive for my taste, but I keep buying it!",
        rating: 3,
        user: USERS.sample,
        product: loccotane
      }
    ]

    loccotane_attributes.each do |hash|
      Review.find_or_create_by!(hash)
    end

  end
end





