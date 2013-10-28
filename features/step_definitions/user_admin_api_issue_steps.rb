
@issue
Given(/^I have already signed up my organization and created a newsletter$/) do
  post "/user_admin_api/organizations?name=myorgname&email=jerome@example.org"
  post "/user_admin_api/organizations/1/newsletters?title=newsletter_title&subtitle=newsletter_subtitle"
end

Given(/^I send a POST request to "(.*?)"$/) do |path|
  post path
end

Then(/^the JSON response body for issues should have the following rel and href values:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end