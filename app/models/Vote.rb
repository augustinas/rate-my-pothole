class Vote

  include DataMapper::Resource

  belongs_to :user, key: true
  belongs_to :pothole, key: true

  property :id, Serial
  property :score, Integer

end
