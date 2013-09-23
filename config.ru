require './init.rb'

map "/" do
	run Implementation::Web
end

map "/api/v1/" do
   run Implementation::API::V1
 end

#map "/mobile" do
#  run Implementation::Mobile
#end