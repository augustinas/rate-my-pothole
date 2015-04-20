require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

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
  use Rack::Flash
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
    user = User.new(username: params[:username],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation]
                   )
    if user.save
      session[:user_id] = user.id
      redirect to '/'
    else
      flash[:errors] = user.errors.full_messages
      redirect to '/users/new'
    end
  end

  get '/sessions/end' do
    username = User.first(id: session[:user_id]).username
    session[:user_id] = nil
    flash[:notice] = "Goodbye, #{username}"
    redirect to '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    username = params[:username]
    password = params[:password]
    user = User.authenticate(username, password)
    if user
      session[:user_id] = user.id
      redirect to '/'
    else
      flash[:errors] = ["Username or password are incorrect"]
      erb :'sessions/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
