require("sinatra")
require("sinatra/contrib/all")

require_relative("../models/burger_deal.rb")

get "/burger-deals" do
  @deals = Deal.all()
  @burgers = Burger.all()
  erb(:"burger_deals/new")
end

post "/burger-deals" do
  burger_deal = BurgerDeal.new(params)
  burger_deal.save()
  redirect to "/restaurants"
end

# firstly try changing save to update function, it may just save a new instance of it can't find one to UPDATE
# secondly, write a bit of ruby logic to assess whether to save or UPDATE
# if you can find the burgerdeal in burgerdeals, UPDATE
# if you can't, then SAVE

# method would be called save_or_update
