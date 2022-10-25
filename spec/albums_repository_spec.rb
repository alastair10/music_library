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
    expect(albums.first.id).to eq('1')
    expect(albums.first.title``).to eq('Dookie')
  end
end