require_relative("../db/sql_runner")

class Restaurant

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO restaurants (name) VALUES ($1) RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def update()
    sql = "UPDATE restaurants SET (name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM restaurants WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM restaurants"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM restaurants"
    result = SqlRunner.run(sql)
    return result.map{|restaurant| Restaurant.new(restaurant)}
  end

end #end of class
