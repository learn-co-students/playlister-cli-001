class Genre
  extend Findable

  attr_reader :name, :url

  @@genres = []

  def initialize
    @@genres << self
  end

  def name=(name)
    @name = name
    @url = "#{parameterize(name)}.html"
  end

  def parameterize(string)
    string.downcase.gsub(' ', '-')
  end

  def self.all
    @@genres
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end
end
