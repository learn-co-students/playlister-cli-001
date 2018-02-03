class Artist
  # code here
  attr_accessor :name, :songs
  @@artists = []

  def initialize
    @@artists << self
    @songs = []
  end

  def self.all
    @@artists
  end

  def self.count
    @@artists.count
  end

  def self.reset_all
    @@artists = []
  end

  def self.create_by_name(name)
    artist = Artist.new()
    artist.name = name
    artist
  end

  def self.find_by_name(name)
    @@artists.each do |artist|
      if artist.name == name
        return artist
      end
    end
    nil
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each do |song|
      @songs << song
      song.artist = self
    end
  end

  def genres
    genres = []
    songs.each do |song|
      if !genres.include?(song.genre)
        genres << song.genre
      end
    end
    genres
  end
end