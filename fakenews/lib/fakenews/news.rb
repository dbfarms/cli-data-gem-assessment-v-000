class Fakenews::News
  attr_accessor :topic, :hash, :trend


  def self.scrape_hashtag(keyword)
    doc = Nokogiri::HTML(open("https://twitter.com/hashtag/#{keyword}"))
    text = doc.search("div.js-tweet-text-container").text
    text_array = text.split("\n\n")
    text_array.delete("")

    handles = doc.css("strong.fullname.show-popup-with-id").each_with_index {|handle, i| Fakenews::Tweet.new(handle, text[i])}
    # o handle.name
    # with_index(1) => 1 handle.name
    # Fakenews::Tweet.new(handle, text)
  end
end
=begin
    doc = Nokogiri::HTML(open("https://twitter.com/hashtag/fakenews"))

    text = doc.search("div.js-tweet-text-container").text
    text_array = text.split("\n\n")
    text_array.delete("")
    handles_array = []
    handles = doc.css("strong.fullname.show-popup-with-id").each {|handle| handles_array << handle.text }


    handles_array.map {|i|  }
    combo_hash = {}
    combo_hash = Hash[handles_array.zip(text_array)]
    combo_hash
    #binding.pry
  end

  def self.scrape_wakeup
    doc = Nokogiri::HTML(open("https://twitter.com/hashtag/wakeup"))

    text = doc.search("div.js-tweet-text-container").text
    text_array = text.split("\n\n")
    text_array.delete("")
    handles_array = []
    handles = doc.css("strong.fullname.show-popup-with-id").each {|handle| handles_array << handle.text }


    handles_array.map {|i|  }
    combo_hash = {}
    combo_hash = Hash[handles_array.zip(text_array)]

    #binding.pry
    combo_hash
  end

  def self.scrape_user_input(input)
    slug = "https://twitter.com/hashtag/"
    slug+=input
    doc = Nokogiri::HTML(open(slug))

    text = doc.search("div.js-tweet-text-container").text
    text_array = text.split("\n\n")
    text_array.delete("")
    handles_array = []
    handles = doc.css("strong.fullname.show-popup-with-id").each {|handle| handles_array << handle.text }


    handles_array.map {|i|  }
    combo_hash = {}
    combo_hash = Hash[handles_array.zip(text_array)]

    #binding.pry
    combo_hash
  end
end

=begin
def self.today # or something else ?
  self.scrape_news
  #instances of fake news today to be sorted topically perhaps?
end

def self.scrape_news
  news = []

  news << self.scrape_fakenews
  news << self.scrape_wakeup

  puts "here's what's fake(?)"




  news

end
=end
