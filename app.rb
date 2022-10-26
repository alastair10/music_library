# file: app.rb

# require_relative 'lib/database_connection'
# require_relative "lib/artist_repository"
# require_relative "lib/albums_repository"


# # We need to give the database name to the method `connect`.
# DatabaseConnection.connect('music_library')

# artist_repository = ArtistRepository.new
# albums_repository = AlbumsRepository.new




# artist_repository.all.each do |artist|
#   p artist
# end

# albums_repository.all.each do |album|
#   p album
# end

# # using the code below to check after implementing the find method 
# artist = artist_repository.find(1)
# puts artist.name # => 'Pixies'

# artist = artist_repository.find(2)
# puts artist.name # => 'ABBA'


require_relative './lib/albums_repository'
require_relative './lib/artist_repository'
require_relative './lib/database_connection'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, albums_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @albums_repository = albums_repository
    @artist_repository = artist_repository
  end

  def run
    # "Runs" the terminal application
    # so it can ask the user to enter some input
    # and then decide to run the appropriate action
    # or behaviour.

    # Use `@io.puts` or `@io.gets` to
    # write output and ask for user input.
    @io.puts "Welcome to the music library manager!"
    @io.puts "1 - List all albums"
    @io.puts "2 - List all artists"
    @io.puts "Enter your choice:"
    input = @io.gets.chomp 

    if input == '1'
      @io.puts "Here is the list of albums:"
      
      result_set = @albums_repository.all
      
      result_set.each do |album|
        @io.puts "#{album.id} - #{album.title}"
      end
      
    else
      @io.puts "Here is the list of artists:"
      
      result_set = @artist_repository.all
      
      result_set.each do |artist|
        @io.puts "#{artist.id} - #{artist.name}"
      end



    end
  end
end

# Don't worry too much about this if statement. It is basically saying "only
# run the following code if this is the main file being run, instead of having
# been required or loaded by another file.
# If you want to learn more about __FILE__ and $0, see here: https://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Variables_and_Constants#Pre-defined_Variables
if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumsRepository.new,
    ArtistRepository.new
  )
  app.run
end