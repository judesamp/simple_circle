require "./init"
require 'rspec'
require 'rspec/expectations'
require 'rack/test'

ENV['RACK_ENV'] = 'test'
config = YAML.load_file('config/database.yml')
DataMapper.setup(:default, config[ENV['RACK_ENV']])
DataMapper.finalize.auto_upgrade!


class TestingWorld
  include RSpec::Expectations
  include RSpec::Matchers
  include Rack::Test::Methods
  
  def app
    Rack::Builder.parse_file('config.ru').first
  end
end

World do
  TestingWorld.new
end


