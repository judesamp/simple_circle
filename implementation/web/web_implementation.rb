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
        
        
    post '/upload' do
      puts params[:file]

       begin
        article = Article.new(:issue_id => 1, :title => "My title")
        article.top_image = params[:top_image]
        article.save
        puts article.to_json
      rescue DataMapper::SaveFailureError => e
        return e.message
      end
      
    end
    
    
    ##temporary_for_testing_purposes
    get '/organizations' do
      newsletter = Organizations.all.to_json
    end
     

   
   end
 end
