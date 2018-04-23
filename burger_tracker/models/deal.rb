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

end
