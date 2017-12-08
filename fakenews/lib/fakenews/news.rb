class Fakenews::News

  def self.today # or something else ?
    #instances of fake news today to be sorted topically perhaps?
    puts "here's what's fake(?)"
    news_1 = News.new
    news_1.topic = "here's a topic"
    news_1.hash = "an example of hashed things?"
    news_1.trend = "new fake news or old fake news?"

    [news_1]
  end

end
