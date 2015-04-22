class Town

  include DataMapper::Resource
  property :id, Serial
  property :name, String
  has n, :potholes, through: Resource

end