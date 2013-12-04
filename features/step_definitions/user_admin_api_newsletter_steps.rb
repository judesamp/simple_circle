@newsletter

Given(/^I have already signed up my organization$/) do
  post "/user_admin_api/organizations", {:name => "myorgname", :email => "jerome@example.org"}.to_json
end

Given(/^I haven't created a newsletter$/) do
  #TODO
end



Then(/^the JSON response body should return the following values:$/) do |elements|
  elements.raw.flatten.map {|element| expect(last_response.body).to include('"'+ element + '"') }
end


Given(/^I send a POST request to "(.*?)" with the body$/) do |path, body|
  post path, body
end

When(/^I send a PUT request to "(.*?)" to update my issue with the body$/) do |path, body|
  put path, body
end