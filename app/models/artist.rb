class Artist
  extend Findable

  attr_reader :name, :songs

  ARTISTS = []

  def initialize
    ARTISTS << self
    @songs = []
  end

  def name=(name)
    @name = name
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
    if !song.genre.nil?
      song.genre.artists << self
    end
  end

  def genres
    self.songs.map { |song| song.genre }.uniq
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end
end

