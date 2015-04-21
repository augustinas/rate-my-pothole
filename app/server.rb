require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require_relative 'data_mapper_setup'

module UserManagement

  def current_user
    User.first(id: session[:user_id])
  end

end

class RateMyPothole < Sinatra::Base

  enable :sessions
  use Rack::Flash
  set :session_secret, 'top secret'

  helpers UserManagement

  get '/' do
    @potholes = Pothole.all
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
      flash[:notice] = "Welcome, #{user.username}!"
      redirect to '/'
    else
      flash[:errors] = user.errors.full_messages
      redirect '/users/new'
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
      flash[:notice] = "Welcome, #{user.username}!"
      redirect to '/'
    else
      flash[:errors] = ["Username or password are incorrect"]
      erb :'sessions/new'
    end
  end

  get '/potholes/new' do
    erb :'potholes/new'
  end

  post '/potholes' do
    street_name = params[:street_name]
    @pothole = Pothole.create(location: street_name)
    p total_score(@pothole)
    flash[:notice] = "Pothole reported on #{street_name}"
    redirect to '/'
  end

  post '/upvote' do
    vote = Vote.new(user_id: session[:user_id],
                    pothole_id: params[:pothole],
                    score: 1)
    if vote.save
      redirect '/'
    else
      flash[:errors] = vote.errors.full_messages
      redirect '/'
    end
  end

  def total_score(pothole)
    Pothole.first(id: pothole.id).votes.inject(0) do |sum, vote|
        sum += vote.score
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
