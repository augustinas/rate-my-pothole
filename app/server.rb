require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'
require_relative 'data_mapper_setup'

module UserManagement

  def current_user
    User.first(id: session[:user_id])
  end

  def new_user(params)
    User.new(username: params[:username],
             email: params[:email],
             password: params[:password],
             password_confirmation: params[:password_confirmation])
  end

end

class RateMyPothole < Sinatra::Base

  enable :sessions
  use Rack::Flash
  set :session_secret, 'top secret'

  helpers UserManagement

  get '/' do
    @potholes = Pothole.all.sort do |x, y|
      weighted_score(y) <=> weighted_score(x)
    end
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = new_user(params)
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
    user = User.authenticate(params)
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
    flash[:notice] = "Pothole reported on #{street_name}"
    redirect to '/'
  end

  post '/flag/:pothole' do
    vote = Vote.new(user_id: session[:user_id],
                    pothole_id: params[:pothole])
    flash[:errors] = vote.errors.full_messages unless vote.save
    redirect '/'
  end

  post '/unflag/:pothole' do
    vote = Vote.first(user_id: session[:user_id],
                      pothole_id: params[:pothole])
    flash[:errors] = vote.errors.full_messages unless vote.destroy
    redirect '/'
  end

  post '/towns' do
    @towns = Town.all
    erb :townlist
  end

  def total_flags(pothole)
    Pothole.first(id: pothole.id).votes.length
  end

  def user_flagged?(user_id, pothole)
    user_votes = User.first(id: user_id).votes
    return true if user_votes.first(pothole_id: pothole.id)
    false
  end

  def weighted_score(pothole)
    Pothole.first(id: pothole.id).votes.inject(0) do |sum, vote|
      vote_value =  1 / (Time.now - vote.created_at.to_time)
      sum += vote_value
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
