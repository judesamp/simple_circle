module Implementation
  class UserAdmin < Sinatra::Base
    set :public_folder, "implementation/user_admin/public"
    set :views, "implementation/user_admin/views"
    
    get '/:organization_id' do
      erb :index
    end
  end
end