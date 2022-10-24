# file: app.rb

require_relative 'lib/database_connection'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

artist_repository = ArtistRepository.new

p artist_repository.all


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