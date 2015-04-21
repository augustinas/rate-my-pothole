env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/pothole_#{env}")
# Add the model requires
require './app/models/User'
require './app/models/Pothole'
require './app/models/Vote'

DataMapper.finalize