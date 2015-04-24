module MapMarkers

  def mark_all_potholes
    Pothole.all.inject([]) do |array, pothole|
      array << { place: pothole.location, lat: pothole.lat, lng: pothole.long }
    end
  end

  def mark_local_potholes
    @potholes.inject([]) do |array, pothole|
      array << { place: pothole.location, lat: pothole.lat, lng: pothole.long }
    end
  end

end
