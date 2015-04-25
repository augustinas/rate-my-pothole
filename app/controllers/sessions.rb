class RateMyPothole < Sinatra::Base
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
      flash.now[:errors] = ["Username or password are incorrect"]
      erb :'sessions/new'
    end
  end
end
