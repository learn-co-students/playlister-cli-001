class Artist

extend Findable
extend Create
extend Reset

attr_accessor :name
attr_reader :songs, :genres

def initialize
  if @@all == nil
    @@all = []
  else
    @@all << self
  end

  @songs = []
  @genres = []
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

def add_songs(songs)
  songs.each do |song|
    @songs << song
    @genres << song.genre
    if song.artist == nil
      song.artist = self
    end
  end
end

def add_song(song)
  @songs << song
  @genres << song.genre
  if song.genre != nil
    song.genre.add_artist(self)
  end

  if song.artist == nil
    song.artist = self
  end
end

end