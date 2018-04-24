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

  def find_burgers()
    sql = "SELECT * FROM burgers WHERE restaurant = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    result.map {|burger| Burger.new(burger)}
  end

  def find_deals()
    sql = "SELECT deals.* FROM deals INNER JOIN burger_deals ON deals.id = burger_deals.deal_id INNER JOIN burgers ON burgers.id = burger_deals.burger_id WHERE burgers.restaurant = $1 GROUP BY deals.id"
    values = [@id]
    result = SqlRunner.run(sql, values)
    result.map {|deal| Deal.new(deal)}
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

  def self.find_by_id(id)
    sql = "SELECT * FROM restaurants WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Restaurant.new(result.first)
  end

end #end of class
