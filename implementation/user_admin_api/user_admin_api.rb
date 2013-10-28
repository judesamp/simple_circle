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

      before do
        headers 'Content-Type' => "application/json;charset=utf-8",
                'Accept' => 'application/json'
      end
      
      get '/' do
        status '303'
        body "You have requested the API root. You must request a specific endpoint. Please see API documentation."
      end
    end
  end
end