class Genre
  @@all = []

  attr_accessor :name, :songs, :artists

  def initialize
    @@all << self
    @songs = []
    @artists = []
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
    all.each do |genre|
      if genre.name == name
        return genre
      end
    end
  end

  def self.create_by_name(name)
    new_genre = self.new
    new_genre.name = name
    new_genre
  end
end