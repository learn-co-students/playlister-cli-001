require 'pry'
class Artist
  
  attr_accessor :name, :songs
  attr_reader :genres
  @@artists = []

  def initialize
    @@artists << self
    @songs = []
    @genres = []
  end

  def add_song(song)
    @songs << song
    song.artist = self
    @genres << song.genre unless @genres.include?(song.genre)
    if !(Genre.genres.include?(song.genre))
      genre = Genre.create_by_name(song.genre)
      genre.artists << self
    else
     genre = Genre.find_by_name(song.genre.name)
     song.genre.artists << self unless genre.artists.include?(self)

    end
  end

  def add_songs(song_arr)
    song_arr.each {|song| add_song(song)}
  end

  def self.all
    @@artists
  end

  def self.count
    @@artists.size
  end

  def self.reset_all
    @@artists.clear
  end

  def self.find_by_name(name)
    @@artists.bsearch {|artist| artist.name == name}
  end

  def self.create_by_name(name)
    artist = Artist.new
    artist.name = name
    artist
  end

end