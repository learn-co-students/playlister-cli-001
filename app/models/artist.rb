class Artist
  extend Findable

  attr_reader :name, :url

  @@artists = []

  def initialize
    @@artists << self
  end

  def name=(name)
    @name = name
    @url = "#{parameterize(name)}.html"
  end

  def parameterize(string)
    string.downcase.gsub(' ', '-')
  end

  def self.all
    @@artists
  end

  def self.reset_all
    @@artists.clear
  end

  def self.count
    self.all.count
  end
end
