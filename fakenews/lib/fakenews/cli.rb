#our cli controller
class Fakenews::CLI

  def call
    menu
    goodbye
  end

  def menu

    input = nil
    while input != "exit"

      puts "pick a trend in fake(?) news: "
      puts "1. #fakenews"
      puts "2. #wakeup"
      puts "3. pick your own"
      puts "exit to exit"

      input = gets.strip.downcase
      array = []

      if input.to_i > 0
        if input.to_i == 1
          Fakenews::News.scrape_hashtag("fakenews")
          Fakenews::Tweet.all.each.with_index(1) do |t, i|
            p "#{i}. #{t.handle}  - #{t.text}\n"
          end
        elsif input.to_i == 2
          Fakenews::News.scrape_wakeup
          array.each.with_index(1) do |t, i|
            p "#{i}. #{t} \n"
          end
        elsif input.to_i == 3
          puts "see if keyword is a trend:"
          input = gets.strip.downcase
          array = Fakenews::News.scrape_user_input(input)
          array.each.with_index(1) do |t, i|
            p "#{i}. #{t} \n"
          end
        end
      elsif input == "list"
        list_news
      else
        puts "try again"
      end
    end
  end

  def goodbye
    puts "more fake news tomorrow..?"
  end
end
