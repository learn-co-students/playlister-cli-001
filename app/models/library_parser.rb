class LibraryParser
  def files
    data_path = File.join(File.dirname(__FILE__), '..', '..', 'db', 'data')
    Dir.entries(data_path)[2..-1]
  end

  def self.parse
    self.new.call
  end

  def parse_filename(filename)
    artist_match = filename.match(/^(.*) -/)
    song_match   = filename.match(/- (.*) \[/)
    genre_match  = filename.match(/\[([^\]]*)\]/)

    artist = artist_match && artist_match[1]
    song   = song_match   && song_match[1]
    genre  = genre_match  && genre_match[1]

    [artist, song, genre]
  end

  def call
    files.each do |filename|
      parts = parse_filename(filename)
      build_song(*parts)
    end
  end

  def build_song(artist_name, song_name, genre_name)
    song   = Song.new.tap   { |song|   song.name   = song_name   }
    genre  = Genre.new.tap  { |genre|  genre.name  = genre_name  }
    artist = Artist.new.tap { |artist| artist.name = artist_name }

    song.genre = genre
    artist.add_song(song)

    song
  end
end
