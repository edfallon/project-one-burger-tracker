require_relative("../models/burger.rb")
require_relative("../models/restaurant.rb")
require("pry-byebug")

Burger.delete_all()
Restaurant.delete_all()



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
  "name" => "Cheeseburger"
  })

  burger1.save()

 burger2 = Burger.new({
   "name" => "Chicken burger"
  })

  burger2.save()

 burger3 = Burger.new({
  "name" => "Veggie burger"
  })

  burger3.save()



  binding.pry
  nil
