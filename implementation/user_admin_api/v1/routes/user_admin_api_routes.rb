module Implementation
  module UserAdminAPI
    class V1 < Sinatra::Base

            #organizations
            #view_org's_newsletter
            get '/organizations/:id/newsletters/:id' do
                organization = Organization.get(params[:id])
                organization.newsletters.to_json
            end

            #create
            post '/organizations' do
                organizations = Organization.process(:name => params['name'])
                organizations.to_json
            end

            #edit
            put '/organizations/:id' do
                organization = Organization.get(params[:id])
                params.delete("splat")
                params.delete("captures")
                organization.edit(params)
                organization.to_json
            end

            delete '/organizations/:id' do
                organization = Organization.get(params[:id])
                params.delete("splat")
                params.delete("captures")
                organization.delete_org
            end
            





            #newsletters
            post '/organizations/:id/newsletters' do
                newsletter = Newsletter.process(:title => params['title'], :subtitle => params['subtitle'])
                newsletter.to_json
            end






            #view one
            get '/organizations/:id/current_newsletter' do
            	organization = Organization.get(params[:id])
            	organization.current_newsletter.to_json
            end

            #create
            post '/newsletters' do
            	newsletter = Newsletter.new(params['newsletter'])
            	newsletter.save
            	status 201
            end

            #update
            put 'newsletters/:id' do
            	newsletter = Newsletter.get(params[:id])
            	return status 404 if newsletter.nil?
            	newsletter.update(params[:newsletter])
            	newsletter.save
            	status 202
            end

            #delete
            delete 'newsletters/:id' do
            	newsletter = Newsletter.get(params[:id])
            	return status 404 if newsletter.nil?
            	newsletter.delete
            	status 202
            end
        end
    end
end