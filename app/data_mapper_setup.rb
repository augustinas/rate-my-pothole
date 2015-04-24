env = ENV['RACK_ENV'] || 'development'
local = "postgres://localhost/pothole_#{env}"

DataMapper.setup(:default, ENV['DATABASE_URL'] || local)
# Add the model requires
require './app/models/user'
require './app/models/pothole'
require './app/models/vote'
require './app/models/town'

DataMapper.finalize
