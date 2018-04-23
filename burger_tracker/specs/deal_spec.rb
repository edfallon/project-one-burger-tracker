require('minitest/autorun')
require_relative('../models/deal.rb')

class TestDeal < MiniTest::Test


  def setup
    @deal1 = Deal.new(
      {"id" => "1",
        "name" => "tuesday 241",
        "restaurant" => 13,
        "burger" => "4"
        })
  end

  def test_deal_name
    assert_equal("tuesday 241", @deal1.name)
  end

  def test_deal_id
    assert_equal(1, @deal1.id)
  end

  def test_deal_restaurant_id
    assert_equal(13, @deal1.restaurant)
  end


end
