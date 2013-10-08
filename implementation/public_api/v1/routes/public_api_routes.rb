
module Implementation
  module PublicAPI
    class V1 < Sinatra::Base

 			#list all
      get '/organization/:id/newsletter_issues' do
      	organization = Organization.get(params[:id])
      	organization.newsletters.to_json
      end 

      #view one
      get '/organization/:id/current_newsletter_issue' do
      	organization = Organization.get(params[:id])
      	organization.current_newsletter.to_json
      end
    end
  end
end