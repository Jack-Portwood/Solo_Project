require_relative('../db/sql_runner')

class Artist

  attr_reader :id, :name, :period, :info

  def initialize (options)
    @id = options ['id'].to_i if options ['id']
    @name = options ['name']
    @style = options ['style']
    @info = options ['info']
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
    sql= "DELETE FROM students
    WHERE id =$1"
    values = [@id]
    Sqlrunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql)
    artist = map_items(artist_data)
    return artist
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artist_data = SqlRunner.run(sql)
    artists = map_items(artist_data)
    return artists
  end

  def self.map_items(artist_data)
    return artist_data.map { |artist| Artist.new(artist)}
  end










end
