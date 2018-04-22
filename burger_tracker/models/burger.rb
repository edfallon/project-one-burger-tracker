require_relative("../db/sql_runner.rb")



class Burger

  attr_reader :id
  attr_accessor :name, :restaurant

  def initialize(options)
    @id = options['id'].to_i
    @name = options["name"]
    @restaurant = options["restaurant"].to_i
  end

  def save()
    sql = "INSERT INTO burgers (name, restaurant) VALUES ($1, $2) RETURNING id;"
    values = [@name, @restaurant]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def update()
    sql = "UPDATE burgers SET (name, restaurant) = ($1, $2) WHERE id = $3"
    values = [@name, @restaurant, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM burgers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def find_restaurant()
    sql = "SELECT * FROM restaurants WHERE id = $1"
    values = [@restaurant]
    result = SqlRunner.run(sql, values)
    return Restaurant.new(result[0])
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM burgers WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Burger.new(result[0])
  end

  def self.all()
    sql = "SELECT * FROM burgers"
    result = SqlRunner.run(sql)
    return result.map{|burger| Burger.new(burger)}
  end

  def self.delete_all()
    sql = "DELETE FROM burgers"
    SqlRunner.run(sql)
  end




end #end of class
