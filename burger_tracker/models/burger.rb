require_relative("../db/sql_runner.rb")



class Burger

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO burgers (name) VALUES ($1) RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def delete()
    sql = "DELETE FROM burgers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
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
