require_relative("../db/sql_runner")


require_relative("../models/burgers.rb")
require_relative("../models/restaurants.rb")

class BurgerDeal

  attr_reader :id
  attr_accessor :name, :restaurant, :burger

  def initialize(options)
    @id = options["id"].to_i
    @restaurant_id = options["restaurant_id"].to_i
    @burger_id = options["burger_id"].to_i
  end



  # def test_deal_restaurant_id
  #   assert_equal(13, @deal1.restaurant_id)
  # end
  #
  # def test_deal_burger_id
  #   assert_equal(4, @deal1.burger_id)
  # end

end
