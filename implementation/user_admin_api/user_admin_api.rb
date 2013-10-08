require 'rubygems'
#require './domain/entities/game_domain'
# 
Dir.glob(File.expand_path("./implementation/user_admin_api/v1/routes") +"/*_routes.rb").each do |file|
  require file
end

module Implementation
  module UserAdminAPI
    class V1 < Sinatra::Base
      set :public_folder, "implementation/user_admin_api/v1/public"
      
      get '/' do
        "Please use a specific endpoint, dude."
      end
    end
  end
end