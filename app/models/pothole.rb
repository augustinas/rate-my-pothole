class Pothole

  include DataMapper::Resource
  property :id, Serial
  property :location, String
  property :created_at, DateTime

end
