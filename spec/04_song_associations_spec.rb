describe Song do
  before(:each) do
    Song.reset_all
  end

  let(:song) { Song.new }

  it "can have a genre" do
    song.genre = Genre.new.tap {|g| g.name = "rap"}
    expect(song.genre.name).to eq("rap")
    expect(song.genre).to be_a(Genre)
  end

  it "has an artist" do
    song.artist = Artist.new.tap {|a| a.name = "miley"}
    expect(song.artist).to be_a(Artist)
    expect(song.artist.name).to eq("miley")
  end

  it 'has a nice to_s format' do
    song.name = "We Can't Stop"
    song.artist = Artist.new.tap {|a| a.name = "Miley Cyrus"}
    song.genre = Genre.new.tap {|g| g.name = "Pop"}
    expect(song.to_s).to eq("Miley Cyrus - We Can't Stop [Pop]")
  end
end