require_relative("../db/sql_runner")


require_relative("../models/burger.rb")
# require_relative("../models/restaurants.rb")

class BurgerDeal

  attr_reader :id
  attr_accessor :deal_id, :burger_id

  def initialize(options)
    @id = options["id"].to_i
    @deal_id = options["deal_id"].to_i
    @burger_id = options["burger_id"].to_i
  end

  def save()
    sql = "INSERT INTO burger_deals (deal_id, burger_id) VALUES ($1, $2) RETURNING id;"
    values = [@deal_id, @burger_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def update()
    sql = "UPDATE burger_deals SET (deal_id, burger_id) = ($1, $2) WHERE id = $3"
    values = [@deal_id, @burger_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM burger_deals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE burger_deals SET (name, day,) = ($1, $2) WHERE id = $3"
    values = [@name, @day, @id]
    SqlRunner.run(sql, values)
  end


  def self.find_by_id(id)
    sql = "SELECT * FROM burger_deals WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return BurgerDeal.new(result[0])
  end

  def self.all()
    sql = "SELECT * FROM burger_deals"
    result = SqlRunner.run(sql)
    return result.map{|burger_deal| BurgerDeal.new(burger_deal)}
  end

  def self.delete_all()
    sql = "DELETE FROM burger_deals"
    SqlRunner.run(sql)
  end



end
