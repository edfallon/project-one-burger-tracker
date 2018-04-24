require_relative("../models/burger.rb")
require_relative("../models/restaurant.rb")
require_relative("../models/deals.rb")
require_relative("../models/burger_deals.rb")
require("pry-byebug")

Burger.delete_all()
Restaurant.delete_all()
Deal.delete_all()
BurgerDeal.delete_all()

restaurant1 = Restaurant.new({
  "name" => "Grillz"
  })

 restaurant1.save()

restaurant2 = Restaurant.new({
  "name" => "Burger House"
  })

  restaurant2.save()

restaurant3 = Restaurant.new({
  "name" => "Bites"
  })

  restaurant3.save()

burger1 = Burger.new({
 "name" => "Cheeseburger",
  "restaurant" => restaurant1.id
 })

 burger1.save()

burger2 = Burger.new({
  "name" => "Chicken burger",
  "restaurant" => restaurant2.id
 })

 burger2.save()

burger3 = Burger.new({
 "name" => "Veggie burger",
 "restaurant" => restaurant3.id
 })

 burger3.save()


 deal1 = Deal.new({
   "name" => "241",
   "day" => "tuesday"
   })

   deal1.save()

 deal2 = Deal.new({
  "name" => "half price",
  "day" => "wednesday"
  })

  deal2.save()

 deal3 = Deal.new({
  "name" => "friend eats free",
  "day" => "friday"
  })

  deal3.save()

  burger_deal1 =BurgerDeal.new({
    "deal_id" => deal1.id,
    "burger_id" => burger1.id
    })

    burger_deal.save()

  burger_deal2 =BurgerDeal.new({
    "deal_id" => deal2.id,
    "burger_id" => burger2.id
    })

    burger_deal2.save()

  burger_deal3 =BurgerDeal.new({
    "deal_id" => deal3.id,
    "burger_id" => burger3.id
    })

    burger_deal3.save







  binding.pry
  nil
