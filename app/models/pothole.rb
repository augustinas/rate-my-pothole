class Pothole

  include DataMapper::Resource

  has n, :votes
  has n, :users, through: :votes

  property :id, Serial
  property :location, String
  property :created_at, DateTime

end
