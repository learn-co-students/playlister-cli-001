class LibraryParser

 def call
  files
  @files.each do |song|
    build_song(song)
  end
 end

  def files
    @files = Dir['db/data/*']

  end

  def parse_filename(filename)
    filename.slice!(0..7)
    filename.slice!(-4..-1)
    info = filename.split(" - ")
  end

  def build_song(filename)
    song_parts = parse_filename(filename)
    new_song = Song.new
    if Artist.find_by_name(song_parts[0]) == nil
      new_artist = Artist.new
      new_artist.name = song_parts[0]
      new_song.artist = new_artist
    else
      new_song.artist = Artist.find_by_name(song_parts[0])
    end
    new_song.name = song_parts[1]

    if Genre.find_by_name(song_parts[2]) == nil
      new_genre = Genre.new
      new_genre.name = song_parts[2]
      new_song.genre = new_genre
    else
      new_song.genre = Genre.find_by_name(song_parts[2])
    end
    new_song
  end


end
