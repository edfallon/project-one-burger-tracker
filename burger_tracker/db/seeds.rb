require_relative("../models/burger.rb")
require("pry-byebug")

Burger.delete_all()


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
