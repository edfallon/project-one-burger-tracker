require('minitest/autorun')
require_relative('../models/restaurant.rb')

class TestRestaurant < MiniTest::Test


  def setup
    @restaurant1 = Restaurant.new({"id" => "1", "name" => "Grillz"})
  end

  def test_restaurant_name
    assert_equal("Grillz", @restaurant1.name)
  end

  def test_restaurant_id
    assert_equal(1, @restaurant1.id)
  end


end
