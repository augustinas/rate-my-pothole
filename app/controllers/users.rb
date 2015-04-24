class RateMyPothole < Sinatra::Base
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
end
