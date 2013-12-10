module Implementation
    module UserAdminAPI
        class V1 < Sinatra::Base
            require 'json'

        #organizations
            #create an organization--updated
            post '/organizations' do
                begin
                    organization = Organization.new.extend(OrganizationRepresenter)
                    organization.from_json(request.body.read)
                    organization.save
                    organization.to_json
                rescue DataMapper::SaveFailureError => e
                  return e.message
                end
            end

            #edit an organization--updated
            put '/organizations/:id' do
                organization = Organization.get(params[:id]).extend(OrganizationRepresenter)
                organization.from_json(request.body.read)
                organization.save
                organization.to_json
            end

            #delete an organization--updated ///don't let user actually delete; todo
            delete '/organizations/:id' do
                begin
                organization = Organization.get(params[:id]).extend(OrganizationRepresenter)
                organization.destroy
                rescue Exception => e
                  return e.message
                end
            end

            #view an organization--updated
            get '/organizations/:id' do
                begin
                organization = Organization.get(params[:id]).extend(OrganizationRepresenter)
                organization.to_json
                rescue NoMethodError => e
                  return "There was a problem with your request. This organization does not appear to exist."
                end
            end

            #view an organization With newsletter--perhaps unnecessary
            get '/organizations/:id/with_newsletter' do
                organization = Organization.get(params[:id]).extend(OrganizationRepresenter)
                organization.to_json
            end
 

        #newsletters
            #create a newsletter--updated
            post '/organizations/:id/newsletters' do
                begin
                    newsletter = Newsletter.new(:organization_id => params['id']).extend(NewsletterRepresenter)
                    newsletter.from_json(request.body.read)
                    newsletter.save
                    newsletter.to_json
                rescue DataMapper::SaveFailureError => e
                  return e.message
                end
            end

             

            #get newsletter//using org id--updated
            get '/organizations/:id/newsletters' do
                organization = Organization.get(params[:id]).extend(OrganizationRepresenter)
                organization.newsletter.to_json
            end

            #get newsletter--updated//without org name...no test covering this yet
            get '/newsletters/:id' do
                newsletter = Newsletter.get(params[:id]).extend(NewsletterRepresenter)
                newsletter.to_json
            end

            #edit a newsletter--updated
            put '/newsletters/:id' do
                newsletter = Newsletter.get(params[:id]).extend(NewsletterRepresenter)
                newsletter.from_json(request.body.read)
                newsletter.save
                newsletter.to_json
            end
            

        #issues
            #create---updated
            post '/newsletters/:id/issues' do
                begin
                    issue = Issue.new(:newsletter_id => params['id']).extend(IssueRepresenter)
                    issue.from_json(request.body.read)
                    issue.save
                    issue.to_json
                rescue DataMapper::SaveFailureError => e
                  return e.message
                end
            end

            #get or view a single issuef that belong to specific org--updated
            get '/issues/:id' do
                issue = Issue.get(params[:id]).extend(IssueRepresenter)
                issue.to_json
            end

            #get or view all issues that belong to specific org--updated
            get '/newsletters/:id/issues' do
                newsletter = Newsletter.get(params[:id]).extend(NewsletterRepresenter)
                newsletter.issues.to_json
            end

            #update or edit--updated
            put '/issues/:id' do
                issue = Issue.get(params[:id]).extend(IssueRepresenter)
                issue.from_json(request.body.read)
                issue.save
                issue.to_json
            end

            #delete--updated
            delete '/issues/:id' do
                begin
                issue = Issue.get(params[:id]).extend(IssueRepresenter)
                issue.destroy
                rescue Exception => e
                  return e.message
                end
            end

            
        #articles
            #create--updated
            post '/issues/:id/articles' do
                begin
                    issue = Issue.get(params[:id]).extend(IssueRepresenter)
                    article = Article.new(:issue_id => params['id']).extend(ArticleRepresenter)
                    article.from_json(request.body.read)
                    issue.articles << article
                    article.save
                    issue.save
                    article.to_json
                rescue DataMapper::SaveFailureError => e
                  return e.message
                end
            end

            #view single article--updated
            get '/articles/:id' do
                article = Article.get(params[:id]).extend(ArticleRepresenter)
                article.to_json 
            end

            #view all articles(in an issue)--updated
            get '/issues/:id/articles' do
                issue = Issue.get(params[:id]).extend(IssueRepresenter)
                issue.articles.to_json
            end

            #update or edit--updated
            put '/articles/:id' do
                article = Article.get(params[:id]).extend(ArticleRepresenter)
                article.from_json(request.body.read)
                article.save
                article.to_json
            end

            #delete--updated
            delete '/articles/:id' do
                begin
                article = Article.get(params[:id]).extend(ArticleRepresenter)
                article.destroy
                rescue Exception => e
                  return e.message
                end
            end

        
        #events
            #create--updated
            post '/issues/:id/events' do
                begin
                    issue = Issue.get(params[:id]).extend(IssueRepresenter)
                    event = Event.new(:issue_id => params['id']).extend(EventRepresenter)
                    event.from_json(request.body.read)
                    issue.events << event
                    event.save
                    issue.save
                    event.to_json
                rescue DataMapper::SaveFailureError => e
                  return e.message
                end
            end

            #view single event--updated
            get '/events/:id' do
                event = Event.get(params[:id]).extend(EventRepresenter)
                event.to_json 
            end

            #view all events(in an issue)--updated
            get '/issues/:id/events' do
                issue = Issue.get(params[:id]).extend(IssueRepresenter)
                issue.events.to_json
            end

            #update or edit
            put '/events/:id' do 
                event = Event.get(params[:id]).extend(EventRepresenter)
                event.from_json(request.body.read)
                event.save
                event.to_json
            end

            #delete
            delete '/events/:id' do
                begin
                event = Event.get(params[:id]).extend(EventRepresenter)
                event.destroy
                rescue Exception => e
                  return e.message
                end
            end
        end
    end
end