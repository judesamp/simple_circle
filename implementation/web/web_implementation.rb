module Implementation
  class Web < Sinatra::Base
    register Mustache::Sinatra
      require './implementation/web/views/web_layout'
      set :public_folder, "implementation/web/public"
      set :view, "implementation/web/templates"
      set :mustache, {
        :views => 'implementation/web/views/',
        :templates => 'implementation/web/templates/'
        }
        
        
    get '/' do
      "test"
      
    end
    
    
    ##temporary_for_testing_purposes
    get '/newsletters' do
      newsletter = Newsletter.all.to_json
    end
     

   
   end
 end
