require 'rubygems'
require 'sinatra/base'
require 'mini_magick'
require 'fog'
require 'carrierwave'
require 'carrierwave/datamapper'
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

access_key_id = config['development']['file_access_key']
secret_access_key = config['development']['file_access_secret']
region = config['development']['file_access_region']
bucket = config['development']['file_access_directory']


CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                 
    :aws_access_key_id      => access_key_id,
    :aws_secret_access_key  => secret_access_key,                      
    :region                 => region           
  }
  config.fog_directory  = bucket
end

puts config['development']['file_access_key']
puts config['development']['file_access_secret']
puts config['development']['file_access_region']
puts config['development']['file_access_directory']

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