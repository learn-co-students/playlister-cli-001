class Genre
  extend Findable

  attr_reader :name, :url, :songs

  GENRES = []

  def initialize
    GENRES << self
    @songs = []
  end

  def name=(name)
    @name = name
    @url = "#{parameterize(name)}.html"
  end

  def parameterize(string)
    string.downcase.gsub(' ', '-')
  end

  def self.all
    GENRES
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end

  def artists
    self.songs.map { |song| song.artist }.uniq
  end
end