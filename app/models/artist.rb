class Artist
  extend Findable

  attr_reader :name, :url, :songs

  ARTISTS = []

  def initialize
    ARTISTS << self
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
    ARTISTS
  end

  def self.reset_all
    ARTISTS.clear
  end

  def self.count
    self.all.count
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def genres
    self.songs.map { |song| song.genre }.uniq
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end
end
