
class Song

extend Findable
extend Create
extend Reset

attr_accessor :name
attr_reader :genre, :artist

def self.all=(something)
  @@all = something
end

def initialize
  if @@all == nil
    @@all = []
  else
    @@all << self
  end
end

def self.all
  @@all
end

def self.count
  @@all.count
end

def genre=(genre)
  @genre = genre
  genre.add_song(self)
end

def artist=(artist)
  @artist = artist
  if @artist.songs.include?(self) == false
    @artist.add_song(self)
  end
end

def to_s
  return "#{@artist.name} - #{self.name} [#{@genre.name}]"
end


end