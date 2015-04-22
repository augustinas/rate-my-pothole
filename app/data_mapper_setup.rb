env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/pothole_#{env}")
# Add the model requires
require './app/models/user'
require './app/models/pothole'
require './app/models/vote'

DataMapper.finalize