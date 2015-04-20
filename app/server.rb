require 'sinatra/base'
require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/pothole_#{env}")

require_relative './models/user'

DataMapper.finalize

DataMapper.auto_upgrade!

module UserManagement

  def foo
    @current_user = session[:user_id]
  end

end

class RateMyPothole < Sinatra::Base

  enable :sessions
  set :session_secret, 'top secret'

  helpers UserManagement

  get '/' do
    foo
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    session[:user_id] = params[:username]
    User.create(username: params[:username],          email: params[:email],
                password: params[:password]
               )
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
