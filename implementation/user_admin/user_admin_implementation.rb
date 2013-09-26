module Implementation
  class UserAdmin < Sinatra::Base
    set :public_folder, "implementation/user_admin/public"
    set :views, "implementation/user_admin/views"
    
    get '/' do
      erb :index
    end
  end
end