
require_relative "./artist"

class ArtistRepository
  
  def all
    sql = 'SELECT id, name, genre FROM artists;'
    result_set = DatabaseConnection.exec_params(sql,[])

    artists = []

    # we are getting properties from db and using them to fill our objects with the right data
    result_set.each do |record|
      artist = Artist.new
      artist.id = record['id']
      artist.name = record['name']
      artist.genre = record['genre']

      artists << artist
   
    end

    return artists

  end
end