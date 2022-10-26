require 'albums_repository'


describe AlbumsRepository do

  # need to add method to reset the table for each test
  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  # call the method
  before(:each) do
    reset_albums_table
  end

  it "returns the list of albums" do
    repo = AlbumsRepository.new
    
    albums = repo.all
    expect(albums.length).to eq(2)
    expect(albums.first.release_year).to eq('1995')
    expect(albums.first.title).to eq('Dookie')
  end

  it "inserts a new Beach Boys album" do
    repo = AlbumsRepository.new

    new_album = Albums.new
    new_album.title = 'Pet Sounds'
    new_album.release_year = '1966'
    new_album.artist_id = '6'
  
      # creates the album
    repo.create(new_album) # => returns nil
  
      # verify this is working by calling all albums...
    albums = repo.all
      # and seeing the newly inserted one is present at the end of the db
    last_album = albums.last
    
    expect(last_album.title).to eq('Pet Sounds')
    expect(last_album.release_year).to eq('1966')
    expect(last_album.artist_id).to eq('6')
  end

end