class Genre
  # code here
  attr_accessor :name, :songs
  @@genres = []

  def initialize
    @@genres << self
    @songs = []
  end

  def self.create_by_name(name)
    genre = Genre.new()
    genre.name = name
    genre
  end

  def self.find_by_name(name)
    @@genres.each do |genre|
      if genre.name == name
        return genre
      end
    end
    nil
  end

  def self.all
    @@genres
  end

  def self.count
    @@genres.count
  end

  def self.reset_all
    @@genres = []
  end

  def artists
    artists = []
    songs.each do |song|
      if !artists.include?(song.artist)
        artists << song.artist
      end
    end
    artists
  end
end