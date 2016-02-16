class Artist
  # code here
  attr_accessor :name, :genre
  attr_reader :songs, :genres

  @@artists = []

  def initialize
 #   @name = name
    @@artists << self
    @songs = []
    @genres = []
  end

  def Artist.all
    @@artists
  end

  def Artist.count
    @@artists.count
  end

  def self.reset_all
    @@artists.clear
  end

  def add_song(song)
    song.artist=(self)
    if song.genre
      genre = song.genre
      genre.artists=(self)
      genre.songs=(song)
    end
 #   puts "genre artists = #{genre.artists}"
    @songs << song
    @genres << song.genre
  #  genre.artists << self
  end

  def add_songs(songs)
    songs.each do |song|
      self.add_song(song)
    end
  end



  def Artist.find_by_name(name)
    @@artists.each do |artist|
      if artist.name == name
        return artist
      end
    end
  end

  def Artist.create_by_name(name)
    artist = Artist.new
    artist.name=(name)
    artist
  end
end