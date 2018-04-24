require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/deal.rb' )


get "/deals" do
  @deals = Deal.all()
  erb(:"deals/index")
end

get "/deals/new" do
  erb(:"deals/new")
end

post "/deals" do
  deal = Deal.new(params)
  deal.save()
  redirect to "/restaurants"
end

get '/deal/:id' do
  @deal = Deal.find_by_id(params['id'].to_i)
  erb(:"deals/show")
end
