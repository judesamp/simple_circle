require 'data_mapper'
require 'pg'
require 'dm-postgres-adapter'
require 'dm-rspec'

require 'rspec'
require 'rack/test'


ENV['RACK_ENV'] = 'test'
config = YAML.load_file('config/database.yml')
DataMapper.setup(:default, config[ENV['RACK_ENV']])
DataMapper::Model.raise_on_save_failure = false
DataMapper.finalize

RSpec.configure do |conf|
 conf.include Rack::Test::Methods
 conf.include DataMapper::Matchers
 conf.before(:each) { DataMapper.auto_migrate! }
end