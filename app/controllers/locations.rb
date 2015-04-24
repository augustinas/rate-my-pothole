class RateMyPothole < Sinatra::Base

  get '/towns' do
    @towns = Town.all
    erb :town_list
  end

  get '/towns/:town' do
    @potholes = Pothole.select do |pothole|
      pothole.town.name == params[:town]
    end
    @lat = Town.first(name: params[:town]).potholes.first.lat
    @lng = Town.first(name: params[:town]).potholes.first.long
    erb :potholes_by_town
  end

end
