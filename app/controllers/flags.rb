class RateMyPothole < Sinatra::Base

  post '/flag/:pothole' do
    vote = Vote.first_or_new(
      user_id: session[:user_id],
      pothole_id: params[:pothole])
    flash[:errors] = vote.errors.full_messages unless vote.save
    if request.xhr?
      pothole = Pothole.first(id: params[:pothole])
      erb :'potholes/_single_pothole',
          locals: { pothole: pothole }, layout: false
    else
      redirect '/'
    end
  end

  post '/unflag/:pothole' do
    vote = Vote.first(user_id: session[:user_id],
                      pothole_id: params[:pothole])
    flash[:errors] = vote.errors.full_messages unless vote.destroy
    if request.xhr?
      pothole = Pothole.first(id: params[:pothole])
      erb :'potholes/_single_pothole',
          locals: { pothole: pothole }, layout: false
    else
      redirect '/'
    end
  end

end
