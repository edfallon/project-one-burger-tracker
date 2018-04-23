require('minitest/autorun')
require_relative('../models/burger_deal_spec.rb')

class TestBurgerDeal < MiniTest::Test


  def setup
    @burger_deal1 = BurgerDeal.new({"id" => "1", "restaurant_id" => "25", "burger_id" => "7"})
  end
