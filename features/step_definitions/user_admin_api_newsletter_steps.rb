@newsletter

Given(/^I have already signed up my organization$/) do
  post "/user_admin_api/organizations?name=myorgname&email=jerome@example.org"
end

Given(/^I haven't created a newsletter$/) do
  #TODO
end

Given(/^I send a POST request to "(.*?)" with a valid title and subtitle$/) do |path|
  post path
end

Then(/^the JSON response body should return the following values:$/) do |elements|
  elements.raw.flatten.map {|element| expect(last_response.body).to include('"'+ element + '"') }
end

