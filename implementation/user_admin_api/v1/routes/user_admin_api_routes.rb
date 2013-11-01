module Implementation
    module UserAdminAPI
        class V1 < Sinatra::Base

        #organizations
            #view_org's_newsletter
            get '/organizations/:id/newsletters/' do
                organization = Organization.get(params[:id])
                organization.newsletters.to_json
            end

            #create an organization
            post '/organizations' do
                organizations = Organization.process(params)
                organizations.to_json
            end

            #edit an organization
            put '/organizations/:id' do
                organization = Organization.get(params[:id])
                params.delete("splat")
                params.delete("captures")
                organization.edit(params)
                organization.to_json
            end

            #delete an organization ///don't let user actually delete; todo
            delete '/organizations/:id' do
                organization = Organization.get(params[:id])
                params.delete("splat")
                params.delete("captures")
                organization.delete_org
            end

            #view an organization
            get '/organizations/:id' do
                organization = Organization.get(params[:id]).extend(OrganizationRepresenter)
                organization.to_json
            end

            #view all organizations
            get '/organizations' do
                organizations = Organization.all
                organizations.to_json
            end
            





        #newsletters
            #create a newsletter
            post '/organizations/:id/newsletters' do
                newsletter = Newsletter.process(:title => params['title'], :subtitle => params['subtitle'], :organization_id => params['id'])
                newsletter.to_json
            end

            #get newsletter// org necessary here?
            get '/organizations/:id/newsletters' do
                newsletter = Newsletter.first(:organization_id => params[:id]).extend(NewsletterRepresenter)
                newsletter.to_json
            end

            #edit a newsletter
            put '/newsletters/:id' do
                newsletter = Newsletter.get(params[:id])
                params.delete("splat")
                params.delete("captures")
                newsletter.edit(params)
                newsletter.to_json
            end
            

        #issues
            #create---ask Ryan how to refactor
            post '/newsletters/:id/issues' do
                params.delete("splat")
                params.delete("captures")
                issue = Issue.process(:newsletter_id => params["id"])
                params.delete("id")
                issue.edit(params)
                issue.to_json
            end

            #get or view a single issuef that belong to specific org
            get '/issues/:id' do
                issue = Issue.get(params[:id]).extend(IssueRepresenter)
                issue.to_json
            end

            #get or view all issues that belong to specific org
            get '/newsletters/:id/issues' do
                newsletter = Newsletter.get(params[:id]).extend(NewsletterRepresenter)
                newsletter.issues.to_json
            end

            #update or edit
            put '/issues/:id' do 
                issue = Issue.get(params[:id]).extend(IssueRepresenter)
                params.delete("splat")
                params.delete("captures")
                issue.edit(params)
                issue.to_json
            end

            delete '/issues/:id' do
                issue = Issue.get(params[:id]).extend(IssueRepresenter)
                issue.destroy
            end

            

        

        #articles
            post '/issues/:id/articles' do
                #issue = Issue.get(params[:id]).extend(IssueRepresenter)
                article = Article.process(:title => params["title"], :issue_id => params["id"])
                #issue.articles << article
                article.to_json
            end

            get '/articles/:id' do
                article = Article.get(params[:id]).extend(ArticleRepresenter)
                article.to_json 
            end

        
        #events
            post '/issues/:id/events' do
                #issue = Issue.get(params[:id]).extend(IssueRepresenter)
                event = Event.process(:event_name => params["event_name"], :issue_id => params["id"])
                #issue.articles << article
                event.to_json
            end

            get '/events/:id' do
                event = Event.get(params[:id]).extend(EventRepresenter)
                event.to_json 
            end
        end
    end
end