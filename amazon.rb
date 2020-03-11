 require 'open-uri'
 require 'nokogiri'
   filepath = "results.html"
     # html_content = File.open(filepath)
        doc = Nokogiri::HTML(open("https://www.amazon.com/s?k=muji+moisturizing+milk&crid=15XGQROZ3Z5HQ&sprefix=%2Caps%2C391&ref=nb_sb_ss_i_1_0"))
     p doc.search('.a-price .a-offscreen')
