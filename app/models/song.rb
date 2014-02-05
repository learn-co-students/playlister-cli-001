class Song
  extend Findable

  attr_accessor :artist
  attr_reader :name, :url, :genre

  @@songs = []

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

  def initialize
    @@songs << self
  end

  def self.reset_all
    @@songs.clear
  end

  def name=(name)
    @name = name
    @url = "#{parameterize(name)}.html"
  end

  def parameterize(string)
    string.downcase.gsub(' ', '-')
  end

  def self.count
    self.all.count
  end

  def self.all
    @@songs
  end

  def to_s
    artist_name = self.artist && self.artist.name
    genre_name = self.genre && self.genre.name

    "#{artist_name} - #{self.name} [#{genre_name}]"
  end
end
