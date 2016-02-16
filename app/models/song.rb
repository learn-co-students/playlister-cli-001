

class Song
  # code here
  attr_accessor :name, :genre, :artist

  @@songs = []

  def initialize
 #   @name = self.name
    @@songs << self
  end

  def Song.count
    @@songs.count
  end

  def self.reset_all
    @@songs.clear
  end

  def self.all
    @@songs
  end

  def genre=(genre)
    genre.songs=(self)
    @genre = genre
  end

  def Song.find_by_name(name)
    @@songs.each do |song|
      if song.name == name
        return song
      end
    end
  end

   def Song.create_by_name(name)
     song = Song.new
     song.name=(name)
     song
  end

  def to_s
    "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end

end