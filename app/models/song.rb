class Song
  @@all = []

  attr_accessor :name, :genre, :artist

  def initialize
    @@all << self
    genre = nil
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
    all.each do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def genre=(new_genre)
    @genre = new_genre
    new_genre.songs << self
  end

  def to_s
    "#{artist.name} - #{name} [#{genre.name}]"
  end
end