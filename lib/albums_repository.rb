require_relative './albums'

class AlbumsRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT all parameters FROM albums;
    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(sql,[])
    # Returns an array of Student objects.

    albums = []

    result_set.each do |record|
      album = Albums.new
      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']

      albums << album
    end

    return albums
  end

  def create(album)
    sql = 'INSERT INTO albums (title, release_year, artist_id) VALUES ($1, $2, $3);'
    sql_params = [album.title, album.release_year, album.artist_id]

    DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end
end