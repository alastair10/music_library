
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

  # Returns a single Artist object.
  def find(id)
    sql = 'SELECT id, name, genre FROM artists WHERE id = $1;'
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    record = result_set[0]

    artist = Artist.new
    artist.id = record['id']
    artist.name = record['name']
    artist.genre = record['genre']

    return artist

  end

  def create(artist)
    sql = 'INSERT INTO artists (name, genre) VALUES ($1, $2);'
    sql_params = [artist.name, artist.genre]

    DatabaseConnection.exec_params(sql, sql_params)
    # don't need to get a result set b/c we're only inserting

    # Doesn't need to return anything b/c it's only creating
    return nil
  end

  def delete(id)
    sql = 'DELETE FROM artists WHERE id = $1;'
    sql_params = [id]

    DatabaseConnection.exec_params(sql, sql_params)
    # don't need a result set

    # Doesn't need to return anything b/c it's only creating
    return nil
  end

  def update(artist)
    sql = 'UPDATE artists SET name = $1, genre = $2 WHERE id = $3;'
    sql_params = [artist.name, artist.genre, artist.id]
  
    DatabaseConnection.exec_params(sql, sql_params)

    return nil  
  end

  def find_with_albums(artist_id)
    sql = 'SELECT artists.id AS "id",
                  artists.name AS "name",
                  artists.genre AS "genre",
                  albums.id AS "album_id",
                  albums.title AS "title",
                  albums.release_year AS "release_year"
          FROM artists
          JOIN albums ON albums.artist_id = artists.id
          WHERE artists.id = $1;'

    sql_params = [artist_id]

    result = DatabaseConnection.exec_params(sql, sql_params)
    # binding.irb

    artist = Artist.new
    artist.id = result.first['id']
    artist.name = result.first['name']
    artist.genre = result.first['genre']

    result.each do |record|
      album = Albums.new
      album.id = record['album_id']
      album.title = record['title']
      album.release_year = record['release_year']

      artist.albums << album
    end

    return artist
  end

end