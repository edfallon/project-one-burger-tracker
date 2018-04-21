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


end
