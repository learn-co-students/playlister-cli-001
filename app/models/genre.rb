class Genre
  attr_accessor :name, :artists
  attr_reader :songs

  @@genres = []

  def initialize
    @@genres << self
    @songs = []
    @artists = []
  end

  def self.genres
    @@genres
  end

  

  def self.count
    @@genres.size
  end

  def self.find_by_name (name)
    @@genres.bsearch {|genre| genre.name == name}
  end

  def self.create_by_name (name)
    genre = Genre.new

    genre.name = name
    genre
  end

  def self.all
    @@genres
  end

  def self.reset_all
    @@genres.clear
  end
end