class Genre

extend Findable
extend Create
extend Reset

attr_accessor :name
attr_writer :artists


def initialize
  if @@all == nil
    @@all = []
  else
    @@all << self
  end

  @songs = []
  @artists = []
end

def self.count
  @@all.count
end

def self.all=(something)
  @@all = something
end

def self.all
  @@all
end

def songs
  @songs
end

def add_song(song)
  @songs << song
end

def add_artist(artist)
  @artists << artist
end

def artists
  @artists.uniq
end

end