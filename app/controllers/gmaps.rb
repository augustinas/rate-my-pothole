class RateMyPothole < Sinatra::Base
  get '/markers' do
    potholes = Pothole.all
    hash = { potholes: [] }
    potholes.each do |pothole|
      hash[:data] << { location: pothole.location, lat: pothole.lat, lng: pothole.long }
    end
    hash.to_json
  end
end
