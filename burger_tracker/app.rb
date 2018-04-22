require("sinatra")
require("sinatra/contrib/all")

require_relative("models/burger.rb")
require_relative("models/restaurant.rb")


get "/burger-tracker" do
  @burgers = Burger.all()
  erb(:index)
end

get "/burger-tracker/new-burger" do
  @restaurant = Restaurant.all()
  erb(:new)
end
