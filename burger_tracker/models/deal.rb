require_relative("../db/sql_runner")

class Deal

  attr_reader :id
  attr_accessor :name, :restaurant, :burger

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @restaurant = options["restaurant"].to_i
    @burger = options["burger"].to_i
  end

end
