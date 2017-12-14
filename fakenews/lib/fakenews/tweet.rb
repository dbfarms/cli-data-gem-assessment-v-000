class Fakenews::Tweet

  attr_accessor :handle, :text
  @@all = []
  def initialize(handle, text)
    @handle = handle
    @text = text
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear
    @@all = []
  end


end 
