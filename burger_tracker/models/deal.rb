require_relative("../db/sql_runner")


# require_relative("../models/burgers.rb")
# require_relative("../models/restaurants.rb")

class Deal

  attr_reader :id
  attr_accessor :name, :day

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @day = options["day"]
  end

  def save()
    sql = "INSERT INTO deals (name, day) VALUES ($1, $2) RETURNING id;"
    values = [@name, @day]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def update()
    sql = "UPDATE deals SET (name, day) = ($1, $2) WHERE id = $3"
    values = [@name, @day, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM deals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def burgers_in_deals()
    sql = "SELECT burgers.* FROM burgers INNER JOIN burger_deals ON burgers.id = burger_deals.burger_id WHERE burger_deals.deal_id = $1;"
    values = [@id]
    burgers = SqlRunner.run(sql, values)
    return burgers.map{|burger| Burger.new(burger)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM deals WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return Deal.new(result[0])
  end

  def self.all()
    sql = "SELECT * FROM deals"
    result = SqlRunner.run(sql)
    return result.map{|deal| Deal.new(deal)}
  end

  def self.delete_all()
    sql = "DELETE FROM deals"
    SqlRunner.run(sql)
  end




end
