require "pry"
class LibraryParser

 def call
  # code here
  self.files.each do |x|
    self.build_song(x)
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
    parsed = self.parse_filename(filename)
    newSong = Song.create_by_name(parsed[1])
    newGenre = Genre.create_by_name(parsed[2])
    newArtist = Artist.create_by_name(parsed[0])
    newSong.genre = newGenre
    newSong.artist = newArtist
    newSong
  end


end
