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
        title: "Brilliant",
        content: "After struggling for many years to find a face moisturiser that wouldn't leave my face feeling oily and gross - cream, oil, gel, nothing worked! - I finally found the understated, minimalist holy grail of face creams. The Light version of the Muji Moisturising Milk for Sensitive Skins (that's the white bottle collection) looks like a cream, but applies and dries like a gel. Rather than rubbing it in completely, you apply it and leave it on to soak in, which only takes a few minutes. It leaves your skin rehydrated without making it shiny or causing breakouts - a must for combination skins like mine. I apply mine every morning after cleaning my face. I find that even gentle face washes will dry out my skin in patches, making it feel stretched and tense, so I apply the milk on the dry and wrinkle-prone areas of my skin to soothe it, before rubbing any leftover onto the rest of my face. I make sure it's all soaked in and dry before putting on makeup.",
        rating: 5,
        user: USERS.sample,
        product: muji
      },
     {
        title: "Absolute STAPLE for me",
        content: "I usually change my skincare more often than my outfits. But the muji skincare have been absolute STAPLES for me. I have extremely reactive skin, and I have repurchased (and will continue to do so) the cleaning cream, light tonight water and this light moisturising milk. It's absolutely beautiful. The texture is like water, sinks in immediately and keeps my skin hydrated all day. The big win for me is none of these products upset my skin in the slightest, and that's after trying full ranges from Chanel, Clinique, Estée Lauder, YSL, L'Oreal, La Mer, Dior and MAC to name a few. That's a LOT of money wasted and now I'm so happy I've found Muji. These products are incredible.",
        rating: 5,
        user: USERS.sample,
        product: muji
      },
     {
        title: "Perfect for dry sensitive skin",
        content: "super moisturizing and non irritating formula. absorbs pretty quickly. no scent. I love that it does exactly what I need it to without irritating my skin or breaking me out. good value, especially if used as part of a longer skincare routine. lots of the serums (from the ordinary) and toners (essences, punkang yul & hada labo) that I use are moisturizing as well, so that makes a difference.",
        rating: 5,
        user: USERS.sample,
        product: muji
      },
      {
        title: "Great for your skin, but very sticky",
        content: "It's great for keeping all the hydration locked in. However it feels really sticky (I'm guessing that it's because of its high moisture qualities). I don't use in my morning routine since it would feel awful. I use it at night time. I recomend to use a small amount, that helps to avoid the sticky feeling.",
        rating: 4,
        user: USERS.sample,
        product: muji
      },
      {
        title: "Great Moisturing Milk",
        content: "While it took a while to receive this I found the packing to be exceptional. They included a hand written card, tea bags and candy. The moisturising milk is great and I use this under my foundation.",
        rating: 4,
        user: USERS.sample,
        product: muji
      },
      {
        title: "Great quality",
        content: "Bought it as a recommendation from gothamista and love it. I have combo skin and it absorbs so good.",
        rating: 4,
        user: USERS.sample,
        product: muji
      },
      {
        title: "Great value!",
        content: "You get so much really nice gentle moisturizing product here for the price! The product itself is very soothing and you can really feel it just sunk in and make your skin feel good.",
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
        title: "Will buy again",
        content: "Has no scent, gives your face the youthful glow. Skin feels softer. Bottle looks just like what is pictured.",
        rating: 5,
        user: USERS.sample,
        product: muji
      },
      {
        title: "Five Stars",
        content: "Really good product! Love it!",
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





