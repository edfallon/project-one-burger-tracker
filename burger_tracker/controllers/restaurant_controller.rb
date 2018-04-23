require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/restaurant.rb' )


get "/restaurants" do
  @restaurant = Restaurant.all()
  erb(:"restaurants/index")
end
