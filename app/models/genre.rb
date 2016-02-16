require 'pry'

class Genre
  # code here
  attr_accessor :name
 # attr_reader :artists

  @@genres = []

  def initialize
    @@genres << self
    @songs = []
    @artists = []
  end

  def Genre.count
    @@genres.uniq.count
  end

  def Genre.all
    @@genres
  end

  def self.reset_all
    @@genres.clear
  end

  def Genre.find_by_name(name)
    @@genres.each do |genre|
      if genre.name == name
        return genre
      end
    end
  end

  def Genre.create_by_name(name)
    genre = Genre.new
    genre.name=(name)
    genre
  end

  def songs=(song)
    @songs << song
  #  @artists << song.artist
 #   binding.pry
  end

  def artists=(artist)
    @artists << artist
  end


  def artists
  #  puts "@artists = #{@artists}"
    @artists.uniq
  end

  def songs
    @songs
  end
end