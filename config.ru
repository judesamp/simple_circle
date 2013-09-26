require './init.rb'

map "/" do
	run Implementation::Web
end

map "/api/v1/" do
   run Implementation::API::V1
end

map "/implementation/user_admin/" do
   run Implementation::UserAdmin
 end



#map "/mobile" do
#  run Implementation::Mobile
#end