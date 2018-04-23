require("sinatra")
require("sinatra/contrib/all")

require_relative("../models/burger.rb")


get "/restaurant/:id/burgers" do
  @restaurant = Restaurant.find_by_id(params['id'].to_i)
  @burgers = @restaurant.find_burgers()
  erb(:"burgers/index")
end

get "/restaurants/burgers/new" do
  @restaurants = Restaurant.all()
  erb(:"burgers/new")
end

# get "/restaurants/:id/burgers" do
#   @restaurant = Restaurant.find_by_id(params['id'].to_i)
# end

post "/restaurant/burgers" do
  burger = Burger.new(params)
  burger.save()
  redirect to "/restaurants"
end
