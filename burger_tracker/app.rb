require("sinatra")
require("sinatra/contrib/all")

require_relative("models/burger.rb")
require_relative("models/restaurant.rb")

require_relative('controllers/burgers_controller')
require_relative('controllers/deals_controller')
require_relative('controllers/restaurant_controller')

get '/' do
  erb( :"views/index" )
end
