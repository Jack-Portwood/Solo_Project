require_relative('../db/sql_runner')

class Exhibit

  attr_accessor :title, :style, :info, :artist_id
  attr_reader :id

  def initialize(options)
    @id = options ['id'].to_i if options ['id']
    @title = options ['title']
    @style = options ['style']
    @info = options ['info']
    @artist_id = options ['artist_id'].to_i

  end

  def title()
    return @title
  end

  def style()
    return @style
  end

  def info()
    return @info
  end

   def artist_id()
   return @artist_id
 end

 #make delete all
 def self.delete_all()
   sql = "DELETE FROM exhibits;"
   SqlRunner.run(sql)
 end

  #CREATE
  def save()
    sql = "INSERT INTO exhibits
    (title, style, info, artist_id )
    VALUES
    ($1, $2, $3, $4)
    RETURNING id"
    values = [@title, @style, @info, @artist_id ]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  # #UPDATE
  def update()
    sql = "UPDATE exhibits
    SET
    (title, style, info, artist_id ) =
    ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@title, @style, @info, @artist_id ,@id ]
    SqlRunner.run(sql,values)
  end

  #DELETE
  def delete()
    sql = "DELETE FROM exhibits
    WHERE id = $1"
    values =[@id]
    SqlRunner.run(sql,values)
  end

  def self.all()
    sql = "SELECT * FROM exhibits"
    exhibit_data = SqlRunner.run(sql)
    exhibits = map_items(exhibit_data)
    return exhibits
  end

  def self.find(id)
     sql = "SELECT * FROM exhibits
     WHERE id =$1"
     values = [id]
     result = SqlRunner.run(sql, values)
     return Exhibit.new(result.first)
   end

  def artist()
    artist = Artist.find(@artist_id)
    return artist
  end

  def self.map_items(exhibit_data)
    return exhibit_data.map { |exhibit| Exhibit.new(exhibit) }
  end











end
