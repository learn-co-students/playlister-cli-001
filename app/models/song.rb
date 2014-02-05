class Song
  attr_reader :name, :url

  @@songs = []

  def self.reset_all
    @@songs.clear
  end

  def name=(name)
    @name = name
    @url = "#{parameterize(name)}.html"
  end

  def parameterize(string)
    string.downcase.gsub(' ', '-')
  end

  def self.count
    self.all.count
  end

  def self.all
    @@songs
  end
end
