module Implementation
  module SuperAdminAPI
    class V1 < Sinatra::Base

            ###### organizations ########

            get '/organizations' do
                Organization.all.to_json
            end

            #view one
            get '/organization/:id' do
                organization = Organization.get(params[:id])
                return status 404 if organization.nil
                organization.to_json
            end

            #create
            post 'organizations' do
                organization = Organization.new(params['organization'])
                organization.save
                status 201
            end

            #update
            put '/organizations/:id' do
                    organization = Organization.get(params[:id])
                return status 404 if organization.nil
                organization.edit(params[:organization])
                organization.save
                status 202
            end

            #delete
            delete '/organizations/:id' do
                organization = Organization.get(params[:id])
                return status 404 if organization.nil?
                organization.delete
                status 202
            end







            ####### newsletters #######

            

            #list all
            get '/organization/:id/newsletters' do
            	organization = Organization.get(params[:id])
            	organization.newsletters.to_json
            end 

            #view one
            get '/organization/:id/current_newsletter' do
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