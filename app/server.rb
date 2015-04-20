require 'sinatra/base'

class RateMyPothole < Sinatra::Base

  get '/' do
    'Hello RateMyPothole!'
  end
  get '/users/new' do
    erb :"users/new"
  end
  get '/sessions/new' do
    erb :"sessions/new"
  end
  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
