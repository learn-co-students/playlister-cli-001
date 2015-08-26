class LibraryParser

 def call
  # code here1
 end

  def files
    @files = Dir['db/data/*']
  end

  def parse_filename(filename)
  
    # at this point a file name looks something like this: 
    # "db/data/Action Bronson - Larry Csonka [indie].mp3"
    # the line below slices off the db/data/ that prepends each file name
  
    filename.slice!(0..7)
    # binding.pry

    # the below regular expressions, given as arguments ot the .match method, will return the section of filename that we want
    artist = filename.match(/^(.*) -/)[1]
    song   = filename.match(/- (.*) \[/)[1]
    genre  = filename.match(/\[([^\]]*)\]/)[1]

    # return the array of the artist's name, song's name and genre's name
    [artist, song, genre]
  end

  def build_song(filename)
    # code here!
  end


end