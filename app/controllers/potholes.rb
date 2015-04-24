class RateMyPothole < Sinatra::Base
  get '/potholes/new' do
    erb :'potholes/new'
  end

  post '/potholes' do
    street_name = params[:street_name]
    town_name = params[:town_name]
    lat = params[:location][:lat] if params[:location]
    lng = params[:location][:lng] if params[:location]
    town = Town.first_or_new(name: town_name)
    if town.save
      @pothole = Pothole.create(
        location: street_name,
        town: town,
        lat: lat,
        long: lng)
      flash[:notice] = "Pothole reported on #{street_name}, #{town_name}"
      if params[:location]
        '/'
      else
        redirect to '/'
      end
    else
      flash[:errors] = town.errors.full_messages
      redirect '/potholes/new'
    end
  end
end
