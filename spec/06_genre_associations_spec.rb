describe Genre do
  before(:each) do
    Genre.reset_all
  end

  let(:genre){Genre.new}
    
  it "has many songs" do
    genre = Genre.new.tap { |g| g.name = 'rap' }
    3.times do
      song = Song.new
      song.genre = genre
    end
    expect(genre.songs.count).to eq(3)
  end

  it "has many artists" do
    genre = Genre.new
    genre.name = 'rap'

    2.times do
      artist = Artist.new
      song = Song.new.tap { |s| s.genre = genre }
      artist.add_song(song)
    end

    expect(genre.artists.count).to eq(2)
  end

  it "keeps unique artists" do
    genre = Genre.new.tap{|g| g.name = 'rap'}
    artist = Artist.new
    song = Song.new
    second_song = Song.new
    song.genre = genre
    second_song.genre = genre
    artist.add_song(song)
    artist.add_song(second_song)
    
    expect(genre.artists.count).to eq(1)
  end
end