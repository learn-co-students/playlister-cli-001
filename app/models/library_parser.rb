class LibraryParser

 def call
  # code here
 end

  def files
    @files = Dir['db/data/*']
  end

  def parse_filename(filename)
  
    # at this point a file name looks something like this: 
    # "db/data/Action Bronson - Larry Csonka - indie.mp3"

    # the line below slices off the db/data/ that prepends each file name
  
    filename.slice!(0..7)

    # now, we need to grab the artist name, song name and genre name out of the filename string

    # right now, the filename looks something like this: "Action Bronson - Larry Csonka - indie.mp3"

    # first, get rid of the '.mp3' file extension:

    filename.slice!(-4..-1)

    # now, split the string on the ' - '

    info = filename.split(" - ")
    
    # our resultant `info` array looks like this: ["Action Bronson", "Larry Csonka", "indie"]
    # we are therefore successfully returning the array of artist, song, genre

 
  end

  def build_song(filename)
    # code here!
  end


end