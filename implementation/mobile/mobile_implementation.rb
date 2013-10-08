module Implementation
  class Mobile < Sinatra::Base
    register Mustache::Sinatra
      require './implementation/web/views/web_layout'
      set :public_folder, "implementation/mobile/public"
      set :view, "implementation/mobile/templates"
      set :mustache, {
        :views => 'implementation/mobile/views/',
        :templates => 'implementation/mobile/templates/'
        }
        
        
    get '/' do
      "test"
      
    end
    
    
    ##temporary_for_testing_purposes
    get '/organizations' do
      newsletter = Organizations.all.to_json
    end
     

   
   end
 end
