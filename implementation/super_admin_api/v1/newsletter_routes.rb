module Implementation
  module API
    class V1 < Sinatra::Base



            ###### churches ########

            #list all
            get '/churches' do
            	Church.all.to_json
            end

            #view one
            get '/church/:id' do
            	church = Church.find(params[:id])
            	return status 404 if church.nil
            	church.to_json
            end

            #create
            post 'churches' do
            	church = Church.new(params['church'])
            	church.save
            	status 201
            end

            #update
            put '/church/:id' do
            		church = Church.find(params[:id])
            	return status 404 if church.nil
            	church.update(params[:church])
            	church.save
            	status 202
            end

            #delete
            delete '/churches/:id' do
                church = Church.find(params[:id])
                return status 404 if church.nil?
                church.delete
                status 202
            end







            ####### newsletters #######

            

            #list all
            get '/church/:id/newsletters' do
            	church = Church.find(params[:id])
            	church.newsletters.to_json
            end 

            #view one
            get '/church/:id/current_newsletter' do
            	church = Church.find(params[:id])
            	church.current_newsletter.to_json
            end

            #create
            post '/newsletters' do
            	newsletter = Newsletter.new(params['newsletter'])
            	newsletter.save
            	status 201
            end

            #update
            put 'newsletters/:id' do
            	newsletter = Newsletter.find(params[:id])
            	return status 404 if newsletter.nil?
            	newsletter.update(params[:newsletter])
            	newsletter.save
            	status 202
            end

            #delete
            delete 'newsletters/:id' do
            	newsletter = Newsletter.find(params[:id])
            	return status 404 if newsletter.nil?
            	newsletter.delete
            	status 202
            end
        end
    end
end