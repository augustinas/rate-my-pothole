require 'sinatra/base'

class RateMyPothole < Sinatra::Base

  get '/' do
    'Hello RateMyPothole!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end
