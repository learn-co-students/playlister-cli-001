describe Artist do
  before(:each) do
    Artist.reset_all
  end

  let(:artist){Artist.new}
  let(:song){Song.new}
  let(:genre){Genre.new}
    
  describe "with songs" do
    it "can have a song added" do
      artist.add_song(song)
      expect(artist.songs).to include(song)
    end

    it "can add multiple songs at once" do
      artist.add_songs([song, Song.new])
     expect(artist.songs.count).to eq(2)
    end
  end

  describe "with genres" do
    it "can have genres" do
      song.genre = genre
      artist.add_song song
      expect(artist.genres).to include(genre)
    end
  end
end