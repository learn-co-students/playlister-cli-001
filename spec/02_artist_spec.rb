describe Artist do
  before(:each) do
    Artist.reset_all
  end

  let(:artist){Artist.new}
  let(:song){Song.new}
  let(:genre){Genre.new}

  it "can be initialized" do
    expect(Artist.new).to be_an_instance_of(Artist)
  end

  it "can have a name" do
    artist.name = "Adele"
    expect(artist.name).to eq("Adele")
  end

  describe "Class methods" do
    it "keeps track of the artists that have been created" do
      expect(Artist.all).to include(artist)
    end

    it "can count how many artists have been created" do
      Artist.new
      expect(Artist.count).to eq(1)
    end

    it "can reset the artists that have been created" do
      Artist.reset_all #you may need to do this before every test
      expect(Artist.count).to eq(0)
    end

    it 'finds an artist by name' do
      artist.name = "Find Me"
      expect(Artist.find_by_name('Find Me')).to eq(artist)
    end

    it 'creates an artist by name' do
      expect(Artist.create_by_name('Find Me').name).to eq('Find Me')
    end

    it 'finds an artist by name' do
      artist.name = "Find Me"
      expect(Artist.find_by_name('Find Me')).to eq(artist)
    end

    it 'creates an artist by name' do
      expect(Artist.create_by_name('Find Me').name).to eq('Find Me')
    end
  end
end
