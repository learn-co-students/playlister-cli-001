class LibraryParser

 def call
  # code here
  files.each do |file|
    build_song(file)
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
    # code here!
    data = parse_filename(filename)
    song = Song.create_by_name(data[1])
    genre = Genre.find_by_name(data[2])
    artist = Artist.find_by_name(data[0])

    if genre
      song.genre = genre
    else
      song.genre = Genre.create_by_name(data[2])
    end

    if artist
      song.artist = artist
    else
      song.artist = Artist.create_by_name(data[0])
    end

    song
  end

end