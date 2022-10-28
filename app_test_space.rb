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

DatabaseConnection.connect('music_library')

artist_repo = ArtistRepository.new
album_repo = AlbumsRepository.new



# This is why we need to use JOIN methods
# to avoid doing two results like below...
# SELECT query to select all albums
all_albums = album_repo.all

all_albums.each do |record|
  puts record.title

  # SELECT  is running a find query for each record
  artist = artist_repo.find(record.artist_id)
  puts artist.name
end

# JOINs allow us to run a single query to more than 1 table