require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/restaurant.rb' )


get "/restaurants" do
  @restaurants = Restaurant.all()
  erb(:"restaurants/index")
end

get "/restaurants/new" do
  erb(:"restaurants/new")
end

post "/restaurants" do
  restaurant = Restaurant.new(params)
  restaurant.save()
  redirect to "/restaurants"
end

get '/restaurant/:id' do
  @restaurant = Restaurant.find_by_id(params['id'].to_i)
  @restaurant_deals = @restaurant.find_deals()
  erb(:"restaurants/show")
end
