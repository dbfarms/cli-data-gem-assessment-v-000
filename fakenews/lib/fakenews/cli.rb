#our cli controller
class Fakenews::CLI

  def call
    list_news
    menu
    goodbye
  end

  def list_news
    puts "today's fake news:"
    @news = Fakenews::News.today #or today? or what?
    @news.each.with_index(1) do |news, i|
      puts "#{i}. #{news}"
    end
  end

  def menu
    puts "pick a topic or maybe a day we'll see "
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        puts @news[input.to_i-1]
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
