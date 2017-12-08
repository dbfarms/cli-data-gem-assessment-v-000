#our cli controller
class Fakenews::CLI

  def call
    list_news
    menu
    goodbye
  end

  def list_news
    @news = Fakenews::News.today #or today? or what?
  end

  def menu
    puts "pick a topic or maybe a day we'll see "
    input = nil
    while input != "exit"
      input = gets.strip.downcase

    end

  end

  def goodbye
    puts "more fake news tomorrow..?"
  end
end
