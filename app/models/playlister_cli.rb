class PlaylisterCLI
  
  attr_accessor :songs
  APPROVED_COMMANDS = [:list, :exit, :play, :help]

  def initialize
    @library_parser = LibraryParser.new
    @library_parser.call
    @on = true
  end

  def on?
    @on
  end

  def call
    while on?
      self.request_input
    end
  end

  def exit
    @on = false
  end

  def request_input
    puts "Enter list, help, exit or play"
    self.get_input
  end

  def get_input
    input = gets.downcase.strip
    self.do_command(input)
  end

  def do_command(input)
    # What does the ruby send method do and why would we use it?
    # http://ruby-doc.org/core-2.1.0/Object.html#method-i-send
    send(input) if command_valid?(input)
  end

  def command_valid?(input)
    APPROVED_COMMANDS.include?(input.downcase.to_sym)
  end

  def list
    Song.all.each_with_index do |song,i|
      puts "#{i+1}. #{song.to_s}"
    end
  end

  def help
    puts "The valid commands are:"
    puts " - list: list songs"
    puts " - play: play a song"
    puts " - exit: leave this awesome app"
  end

  def play
    puts "Please enter a song name or number. \n"
    play_song(user_input)
  end

  def play_song(song_to_play)
    if song_to_play.to_i > 0
      puts "\nNow playing #{Song.all[song_to_play.to_i]}\n"
    else
      puts "\nNow playing #{Song.find_by_name(song_to_play)}"
    end
  end

end