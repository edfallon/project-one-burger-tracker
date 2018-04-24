require_relative("../db/sql_runner")


# require_relative("../models/burgers.rb")
# require_relative("../models/restaurants.rb")

class BurgerDeal

  attr_reader :id
  attr_accessor :deal_id, :burger_id

  def initialize(options)
    @id = options["id"].to_i
    @deal_id = options["deal_id"].to_i
    @burger_id = options["burger_id"].to_i
  end



end
