# file: app.rb

require_relative 'lib/database_connection'
require_relative "lib/artist_repository"

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

artist_repository = ArtistRepository.new

artist_repository.all.each do |artist|
  p artist
end



# started with the below code until rspec test passes.  Replaced with the above two lines

=begin

# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, name, genre FROM artists;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
result.each do |record|
  p record
end

=end