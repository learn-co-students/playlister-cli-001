class LibraryParser

 def call
  self.files.each {|file| build_song(file)}
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
    arr_file = parse_filename(filename)
    song = Song.create_by_name(arr_file[1])
    artist = Artist.create_by_name(arr_file[0])
    artist.add_song(song)
    genre = Genre.create_by_name(arr_file[2])
    song.genre = genre
    song
  end


end
