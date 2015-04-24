require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require 'json'
require_relative 'data_mapper_setup'
require_relative 'helpers/user_management'
require_relative 'helpers/rating_management'
require_relative 'helpers/gmaps'

class RateMyPothole < Sinatra::Base

  enable :sessions
  use Rack::Flash
  set :session_secret, 'top secret'

  helpers UserManagement, RatingManagement, MapMarkers

  get '/' do
    potholes = Pothole.all.sort do |x, y|
      weighted_score(y) <=> weighted_score(x)
    end
    erb :index, locals: { potholes: potholes }
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end

require_relative 'controllers_init'