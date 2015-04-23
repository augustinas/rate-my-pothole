class Pothole

  include DataMapper::Resource

  has n, :votes
  has n, :users, through: :votes
  has 1, :town, through: Resource

  property :id, Serial
  property :location, String
  property :created_at, DateTime
  property :lat, Float
  property :long, Float

end
