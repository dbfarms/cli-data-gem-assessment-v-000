class Fakenews::News
  attr_accessor :topic, :hash, :trend

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

  def self.scrape_fakenews
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
end
