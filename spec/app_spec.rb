require_relative '../app'

def reset_albums_table
  seed_sql = File.read('spec/seeds_albums.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe Application do

    # call the method
    before(:each) do
      reset_albums_table
    end
  
    it "returns list of albums" do
      io = double :io
      expect(io).to receive(:puts).with("Welcome to the music library manager!")
      expect(io).to receive(:puts).with("1 - List all albums")
      expect(io).to receive(:puts).with("2 - List all artists")
      expect(io).to receive(:puts).with("Enter your choice:")
      expect(io).to receive(:gets).and_return('1')
      expect(io).to receive(:puts).with("Here is the list of albums:")
      expect(io).to receive(:puts).with("1 - Dookie")
      expect(io).to receive(:puts).with("2 - Dude Ranch")

      database_name = 'music_library_test'
      albums_repository = AlbumsRepository.new
      artist_repository = ArtistRepository.new

      application = Application.new(database_name, io, albums_repository, artist_repository)
      application.run
    end

    it "returns list of artists" do
      io = double :io
      expect(io).to receive(:puts).with("Welcome to the music library manager!")
      expect(io).to receive(:puts).with("1 - List all albums")
      expect(io).to receive(:puts).with("2 - List all artists")
      expect(io).to receive(:puts).with("Enter your choice:")
      expect(io).to receive(:gets).and_return('2')
      expect(io).to receive(:puts).with("Here is the list of artists:")
      expect(io).to receive(:puts).with("1 - Something else")
      expect(io).to receive(:puts).with("2 - Blink-182")

      database_name = 'music_library_test'
      albums_repository = AlbumsRepository.new
      artist_repository = ArtistRepository.new

      application = Application.new(database_name, io, albums_repository, artist_repository)
      application.run
    end
end