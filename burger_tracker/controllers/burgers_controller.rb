require("sinatra")
require("sinatra/contrib/all")

require_relative("../models/burger.rb")


get "/restaurant/:id/burgers" do
  @burgers = Burger.all()
  erb(:"burgers/index")
end

get "/restaurant/:id/burgers/new" do
  @restaurant = Restaurant.all()
  erb(:"burgers/new")
end

post "/restaurant/:id/burgers" do
  burger = Burger.new(params)
  burger.save()
  redirect to "/restaurants"
end
