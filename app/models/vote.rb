class Vote

  include DataMapper::Resource

  belongs_to :user
  belongs_to :pothole

  property :id, Serial
  property :created_at, DateTime

end
