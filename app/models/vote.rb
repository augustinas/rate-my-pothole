class Vote

  include DataMapper::Resource

  belongs_to :user
  belongs_to :pothole

  property :id, Serial
  property :score, Integer

end
