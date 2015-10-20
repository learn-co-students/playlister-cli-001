require "pry"
class Song
  # code here
  SONGS = []
  attr_accessor :name, :genre, :artist
  def initialize
    SONGS << self
  end

  def genre=(new_genre)
    @genre = new_genre
    @genre.songs << self
  end

  def artist=(new_artist)
    @artist = new_artist
    artist = Artist.new
    artist.name = new_artist
  end

  def self.reset_all
    SONGS.clear
  end

  def self.all
    SONGS
  end

  def self.count
    SONGS.count
  end

  def to_s
    "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end

  def self.find_by_name(name)
    SONGS.each do |x|
      if x.name == name
        return x
      end
    end
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    SONGS << song
    return song
  end
end
