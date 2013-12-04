Given(/^I create an event by sending a POST request to "(.*?)"$/) do |path|
  post path
end

Given(/^I create another event by sending a POST request to "(.*?)"$/) do |path|
  post path
end

Given(/^I have already created an event by sending a POST request to "(.*?)"$/) do |path|
  post path
end

When(/^I send a PUT request to "(.*?)" in order to update my event$/) do |path|
  put path
end