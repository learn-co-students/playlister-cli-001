require "pry"

class LibraryParser

 def call
   files.each do |filename|
     build_song(filename)
   end
 end

  def files
    @files = Dir['db/data/*']
 #   binding.pry
  end

  def parse_filename(filename)
    filename.slice!(0..7)
    filename.slice!(-4..-1)
    info = filename.split(" - ")
  end

  def build_song(filename)
    parse = parse_filename(filename)
    song = parse[1]
    artist = parse[0]
    genre = parse[2]
    song_obj = Song.create_by_name(song)
    artist_obj = Artist.create_by_name(artist)
    genre_obj = Genre.create_by_name(genre)
    artist_obj.add_song(song_obj)
    song_obj.genre=(genre_obj)
    song_obj
  end


end
