@issues
Given(/^I have already signed up my organization and created a newsletter$/) do
  post "/user_admin_api/organizations?name=myorgname&email=jerome@example.org"
  post "/user_admin_api/organizations/1/newsletters?title=newsletter_title&subtitle=newsletter_subtitle"
end

Given(/^I send a POST request to "(.*?)"$/) do |path|
  post path
end

Given(/^I send another POST request to "(.*?)"$/) do |path|
  post path
end

Then(/^the JSON response body should be an array with a length of "(.*?)"$/) do |num_of_issues|
	parsed_response = JSON.parse(last_response.body)
  expect(parsed_response.length).to eq num_of_issues.to_i
end

When(/^I send a PUT request to "(.*?)" in order to update my issue$/) do |path|
  put path
end

Then(/^the the JSON response body should not have the key\/value pair, "(.*?)" and "(.*?)"$/) do |key, value|
  parsed_response = JSON.parse(last_response.body)
  expect(parsed_response).to_not include key => value
end

Then(/^the the JSON response body should have the key\/value pair, "(.*?)" and "(.*?)"$/) do |key, value|
  parsed_response = JSON.parse(last_response.body)
  expect(parsed_response).to include key => value
end
