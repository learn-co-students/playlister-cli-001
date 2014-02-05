class Artist
  extend Findable

  attr_reader :name, :url, :songs

  @@artists = []

  def initialize
    @@artists << self
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
    @@artists
  end

  def self.reset_all
    @@artists.clear
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
