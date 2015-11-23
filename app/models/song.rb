require 'pry'

class Song
  
  attr_accessor :name, :artist
  attr_reader :genre

  @@songs = []

  def initialize
    @@songs << self
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

  def to_s
    "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end

  def self.count
    @@songs.size
  end

  def self.all
    @@songs
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song
    #binding.pry
  end

  def self.find_by_name(name)
    @@songs.bsearch {|song| song.name == name}
  end

  def self.reset_all
    @@songs.clear
  end
end

#Song.create_by_name('Find Me')