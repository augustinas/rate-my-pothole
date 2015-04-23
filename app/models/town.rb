class Town

  include DataMapper::Resource
  property :id, Serial
  property :name, String, required: true, message: "Please provide a town"
  has n, :potholes, through: Resource

end