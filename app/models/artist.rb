class Artist
  # code here
  attr_accessor :songs, :genres, :name
  ARTISTS = []

  def initialize
    ARTISTS << self
    @songs = []
    @genres = []
  end

  def add_song(song)
    self.songs << song
    self.genres << song.genre
    song.artist = self

    song.genre.artists << self if song.genre && !song.genre.artists.include?(self)
  end

  def add_songs(songlist)
    songlist.each do |x|
      self.add_song(x)
    end
  end

  def self.all
    ARTISTS
  end

  def self.count
    ARTISTS.count
  end

  def self.find_by_name(name)
    ARTISTS.each do |x|
      if x.name == name
        return x
      end
    end
  end

  def self.create_by_name(name)
    artist = self.new
    artist.name = name
    ARTISTS << artist
    return artist
  end

  def self.reset_all
    ARTISTS.clear
  end


end
