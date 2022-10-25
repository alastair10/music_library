# file: app.rb

require_relative 'lib/database_connection'
require_relative "lib/artist_repository"
require_relative "lib/albums_repository"


# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

artist_repository = ArtistRepository.new
albums_repository = AlbumsRepository.new




artist_repository.all.each do |artist|
  p artist
end

albums_repository.all.each do |album|
  p album
end

# using the code below to check after implementing the find method 
artist = artist_repository.find(1)
puts artist.name # => 'Pixies'

artist = artist_repository.find(2)
puts artist.name # => 'ABBA'