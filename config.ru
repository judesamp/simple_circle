require './init.rb'

map "/" do
	run Implementation::Web
end

map "/mobile" do
  run Implementation::Mobile
end

map "/user_admin/" do
   run Implementation::UserAdmin
end

#map "/super_admin/" do
#   run Implementation::SuperAdmin::V1
#end


######## API routes #########

map "/public_api/" do
   run Implementation::PublicAPI::V1
end

map "/user_admin_api/" do
   run Implementation::UserAdminAPI::V1
end

map "/super_admin_api/" do
   run Implementation::SuperAdminAPI::V1
end






