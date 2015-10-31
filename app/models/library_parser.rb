class LibraryParser

  def call
    files.each { |file| build_song(file) }
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
    song_info = parse_filename(filename)
    artist = Artist.create_by_name(song_info[0])
    song = Song.create_by_name(song_info[1])
    genre = Genre.create_by_name(song_info[2])
    song.artist = artist
    song.genre = genre
    song
  end


end
