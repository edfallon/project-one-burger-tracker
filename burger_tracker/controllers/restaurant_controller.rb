require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/restaurant.rb' )


get "/restaurants" do
  @restaurant = Restaurant.all()
  erb(:"restaurants/index")
end

# get '/restaurant/:id' do
#   @restaurant = .find(params['id'].to_i)
#   erb(:"restaurant/new")
# end
