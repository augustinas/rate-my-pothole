class RateMyPothole < Sinatra::Base

  post '/flag/:pothole' do
    vote = Vote.first_or_new(
      user_id: session[:user_id],
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

end
