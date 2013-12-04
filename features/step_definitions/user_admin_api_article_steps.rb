Given(/^I have already created an issue by sending a POST request to "(.*?)"$/) do |path|
  post path
end

Given(/^I have already created an article by sending a POST request to "(.*?)"$/) do |path|
  post path
end

Given(/^I send another POST request to "(.*?)" with the body$/) do |path, body|
  post path, body
end

When(/^I send a PUT request to "(.*?)" with the body$/) do |path, body|
  put path, body
end