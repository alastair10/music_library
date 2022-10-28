require "artist_repository"

describe ArtistRepository do

  # this method reads a file and uses the pg gem to connect to the db and execute the SQL
  def reset_artists_table
    seed_sql = File.read('spec/seeds_artists.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_artists_table
  end


  it "returns the list of artists" do
    repo = ArtistRepository.new
    
    artists = repo.all
        
    expect(artists.length).to eq(2)
    expect(artists.first.id).to eq('1')
    expect(artists.first.name).to eq ('Pixies')
  end

  it "returns the Pixies as a single artist" do
    repo = ArtistRepository.new

    artist = repo.find(1)
    expect(artist.name).to eq('Pixies')
    expect(artist.genre).to eq('Rock')
  end

  it "returns Blink-182 as another single artist" do
    repo = ArtistRepository.new
  
    artist = repo.find(2)
    expect(artist.name).to eq('Blink-182')
    expect(artist.genre).to eq('Alternative')
  end

  it "creates a new artist Beatles of genre pop" do
    repo = ArtistRepository.new

    new_artist = Artist.new
    new_artist.name = 'Beatles'
    new_artist.genre = 'Pop'

    repo.create(new_artist) # => returns nil

    artists = repo.all
    last_artist = artists.last

    expect(last_artist.name).to eq('Beatles')
    expect(last_artist.genre).to eq('Pop')  
  end

  it "deletes artists with id = 1" do
    repo = ArtistRepository.new

    id_to_delete = 1
  
    repo.delete(id_to_delete)
  
    #now there should only be 1 artist (with id = 2) left after the deletion
    all_artists = repo.all
    expect(all_artists.length).to eq(1)
    expect(all_artists.first.id).to eq('2')
  end

  it "deletes both artists" do
    repo = ArtistRepository.new

    repo.delete(1)
    repo.delete(2)
  
    #now there should be an empty db
    all_artists = repo.all
    expect(all_artists.length).to eq(0)
  end

  it "updates the artist with new data" do
    repo = ArtistRepository.new

    artist = repo.find(1)

    artist.name = 'Something else'
    artist.genre = 'Disco'

    repo.update(artist)

    # now need to verify the update happened
    #call the same artists
    updated_artist = repo.find(1)

    expect(updated_artist.name).to eq('Something else')
    expect(updated_artist.genre).to eq('Disco')
  end

  it "updates the only one field (name) of the artist" do
    repo = ArtistRepository.new

    artist = repo.find(1)

    artist.name = 'Something else'

    repo.update(artist)

    # now need to verify the update happened
    #call the same artists
    updated_artist = repo.find(1)

    expect(updated_artist.name).to eq('Something else')
    expect(updated_artist.genre).to eq('Rock')
  end

  it "finds the artist with related albums" do
    repo = ArtistRepository.new

    artist = repo.find_with_albums(1)
    
    expect(artist.name).to eq('Pixies')
    expect(artist.albums.length).to eq(1)
  end
end