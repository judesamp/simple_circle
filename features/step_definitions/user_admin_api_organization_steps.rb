@organization
Given(/^I am a valid user of the User Admin API$/) do
  #TODO
end

Given(/^I haven't created an organization$/) do
  #NECESSARY?
end

Given(/^I send a POST request to "(.*?)" with a valid organization name and email$/) do |path|
  post path, {:name => "myorgname", :email => "myorgemail@orgname.com" }.to_json
end

When(/^I send a PUT request to "(.*?)" with a body of "(.*?)"$/) do |path, body|
  put path, { :email => "jeremy@example.com" }.to_json
end








