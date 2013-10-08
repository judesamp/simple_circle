require 'rubygems'
require 'sinatra/base'
require 'mustache/sinatra'
require 'haml'
require 'bundler/setup'
require 'pry'
require 'pry-doc'
require 'data_mapper'
require 'pg'
require 'dm-postgres-adapter'
require "dm-noisy-failures"

# Bundler Setup.


# Load all domain files.
Dir["./app/**/*.rb"].each do |file|
  require file
end

# Load all implementation files.
Dir["./implementation/**/*.rb"].each do |file|
  require file
end



ENV['RACK_ENV'] = 'development'
config = YAML.load_file('config/database.yml')
DataMapper.setup(:default, config[ENV['RACK_ENV']])
DataMapper.finalize.auto_upgrade!


# require 'rubygems'
# require 'sinatra/base'
# require 'bundler/setup'
# require 'thin'
# require 'shotgun'
# require 'mustache/sinatra'
# #require 'roar/representer/json'
# #require 'roar/representer/feature/hypermedia'
# require 'data_mapper'
# require 'dm-postgres-adapter'
# require 'pry'
# require 'pry-doc'
# 
# 
# 
# Bundler.require(:default)
# 
# # Load all domain files.
# Dir["./domain/**/*.rb"].each do |file|
#   require file
# end
# 
# # Load all implementation files.
# Dir["./implementation/**/*.rb"].each do |file|
#   require file
# end
# 
# # Load all persistence files.
# Dir["./persistence/**/*.rb"].each do |file|
#   require file
# end
# 
# 
# DataMapper::setup(:default, (ENV['DATABASE_URL'] || "postgres://localhost/newsletter"))
# DataMapper.auto_upgrade!



##DataMapper.finalize.auto_upgrade!