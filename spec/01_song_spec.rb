describe Song do
  before(:each) do
    Song.reset_all
  end

  let(:song) { Song.new }

  it "can initialize a song" do
    expect(song).to be_a(Song)
  end

  it "can have a name" do
    song.name = "Jump Around"
    expect(song.name).to eq("Jump Around")
  end

  describe "Class Methods" do

    it "can reset all songs" do
      Song.reset_all
      expect(Song.count).to eq(0)
    end

    it "keeps track of the songs that have been created" do
      expect(Song.all).to include(song)
    end

    it 'finds a song object by name' do
      song.name = "Find Me"
      expect(Song.find_by_name('Find Me')).to eq(song)
    end

    it 'creates a song object by name' do
      expect(Song.create_by_name('Find Me').name).to eq('Find Me')
    end
  end
end
