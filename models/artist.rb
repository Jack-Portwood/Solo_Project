require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :name, :style, :info

  def initialize (options)
    @id = options ['id'].to_i if options ['id']
    @name = options ['name']
    @style = options ['style']
    @info = options ['info']
  end

  def name()
    return @name
  end

  def style()
    return @style
  end

  def info()
    return @info
  end

  # delete all
  def self.delete_all()
    sql = "DELETE FROM artists;"
    SqlRunner.run(sql)
  end



  #CREATE
  def save()
    sql = "INSERT INTO artists
    (name, style, info)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@name, @style, @info]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id.to_i
  end

  #DELETE
  def delete()
    sql= "DELETE FROM artists
    WHERE id =$1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    artist = Artist.new (result)
    return artist
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artist_data = SqlRunner.run(sql)
    artists = map_items(artist_data)
    puts artists
    return artists
  end

  def update()
    sql = "UPDATE artists
    SET
    (name, style, info) =
    ($1, $2, $3)
    WHERE id = $4"
    values = [@name, @style, @info, @id]
    SqlRunner.run(sql,values)
  end

  def self.map_items(artist_data)
    return artist_data.map { |artist| Artist.new(artist)}
  end










end
