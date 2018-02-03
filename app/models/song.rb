class Song
  # code here
  attr_accessor :name, :genre, :artist
  @@songs = []

  def initialize
    @@songs << self
  end

  def self.create_by_name(name)
    song = Song.new()
    song.name = name
    song
  end

  def self.reset_all
    @@songs = []
  end

  def self.count
    @@songs.count
  end

  def self.all
    @@songs
  end

  def self.find_by_name(name)
    @@songs.each do |song|
      if song.name == name
        return song
      end
    end
    nil
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

  def artist=(artist)
    @artist = artist
  end

  def to_s
    "#{@artist.name} - #{@name} [#{@genre.name}]"
  end
end