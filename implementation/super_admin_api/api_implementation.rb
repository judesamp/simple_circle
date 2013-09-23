require 'rubygems'
#require './domain/entities/game_domain'
# 
Dir.glob(File.expand_path("./implementation/api/v1/routes") +"/*_routes.rb").each do |file|
  require file
end

module Implementation
  module API
    class V1 < Sinatra::Base
      set :public_folder, "implementation/api/v1/public"
      
      get '/' do
        "Please use a specific endpoint."
      end
    end
  end
end