require('minitest/autorun')
require_relative('../models/burger_deal.rb')

class TestBurgerDeal < MiniTest::Test


  def setup
    @burger_deal1 = BurgerDeal.new({"id" => "1", "restaurant_id" => "25", "burger_id" => "7"})
  end

  def test_burger_deal_id
    assert_equal(1, @burger_deal1.id)
  end

  def test_burger_deal_restaurant_id
    assert_equal(25, @burger_deal1.restaurant_id)
  end

  def test_burger_deal_burger_id
    assert_equal(7, @burger_deal1.burger_id)
  end

end
