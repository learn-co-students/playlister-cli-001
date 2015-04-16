class Song
  extend Findable

  attr_accessor :artist
  attr_reader :name, :genre

  SONGS = []

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

  def initialize
    SONGS << self
  end

  def self.reset_all
    SONGS.clear
  end

  def name=(name)
    @name = name
  end

  def self.count
    self.all.count
  end

  def self.all
    SONGS
  end

  def to_s
    artist_name = self.artist && self.artist.name
    genre_name = self.genre && self.genre.name

    "#{artist_name} - #{self.name} [#{genre_name}]"
  end
end