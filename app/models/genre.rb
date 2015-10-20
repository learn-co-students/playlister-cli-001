class Genre
  # code here
  attr_accessor :name, :songs, :artists

  GENRES = []

  def initialize
    GENRES << self
    @songs = []
    @artists = []
  end



  def self.count
    GENRES.count
  end

  def self.all
    GENRES
  end

  def self.reset_all
    GENRES.clear
  end

  def self.find_by_name(name)
    GENRES.each do |x|
      if x.name == name
        return x
      end
    end
  end

  def self.create_by_name(name)
    genre = self.new
    genre.name = name
    GENRES << genre
    genre
  end
end
