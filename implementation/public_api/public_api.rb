require 'rubygems'

Dir.glob(File.expand_path("./implementation/public_api/v1/routes") +"/*_routes.rb").each do |file|
  require file
end

module Implementation
  module PublicAPI
    class V1 < Sinatra::Base
      set :public_folder, "implementation/public_api/v1/public"
      
      get '/' do
        "Please use a specific endpoint."
      end
    end
  end
end