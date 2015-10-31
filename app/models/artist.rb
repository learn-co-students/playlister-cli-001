require 'pry'

class Artist
  @@all = []

  attr_accessor :name, :songs, :genres

  def initialize
    @@all << self
    @songs = []
    @genres = []
  end

  def self.all
    @@all
  end

  def self.count
    all.length
  end

  def self.reset_all
    all.clear
  end

  def self.find_by_name(name)
    all.each do |artist|
      if artist.name == name
        return artist
      end
    end
  end

  def self.create_by_name(name)
    new_artist = self.new
    new_artist.name = name
    new_artist
  end

  def add_song(new_song)
    songs << new_song
    new_song.artist = self
    genres << new_song.genre
    if new_song.genre && !new_song.genre.artists.include?(self)
      new_song.genre.artists << self
    end
  end

  def add_songs(new_songs)
    new_songs.each {|song| add_song(song)}
  end
end