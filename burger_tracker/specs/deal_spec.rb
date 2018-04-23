require('minitest/autorun')
require_relative('../models/deal.rb')

class TestBurger < MiniTest::Test


  def setup
    @deal1 = Deal.new(
      {"id" => "1",
        "name" => "tuesday 241",
        "restaurant" => "13",
        "burger" => "4"
        })
  end

  def test_deal_name
    assert_equal("tuesday 241", @deal1.name)
  end


end
