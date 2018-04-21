require('minitest/autorun')
require_relative('../models/burger.rb')

class TestBurger < MiniTest::Test


  def setup
    @burger1 = Burger.new("Cheeseburger")
  end

  def test_burger_name
    assert_equal("Cheeseburger", @burger1.name)
  end


end
