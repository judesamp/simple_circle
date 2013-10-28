World()

Given /^I am a valid API user$/ do
  #TODO
end

Given /^I send and accept JSON$/ do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
end

When /^I send a GET request to "([^\"]*)"$/ do |path|
  get path
end

When /^I send a POST request to "([^\"]*)" with the following:$/ do |path, body|
  post path, body
end

When /^I send a PUT request to "([^\"]*)" with the following:$/ do |path, body|
  put path, body
end

When /^I send a DELETE request to "([^\"]*)"$/ do |path|
  delete path
end

# for ensuring your nested structure is correct
# Then /^the JSONn response body should equal:$/ do |path, body|
#   expected_body = {"user":{"email":"lukeduke@example.com","username":"lukeduke","first_name":"Luke","last_name":"Duke","bio":"I changed this here bio!"}}
#   expect(body.from_json).to eq expected_body.from_json
# end

Then /^the JSON response headers should set appropriately$/ do
  expect(last_response.header["Content-Type"]).to eq "application/json;charset=utf-8"
  expect(last_response.header["Accept"]).to eq "application/json"
end

Then /^the response code should be "([^\"]*)"$/ do |status|
  expect(last_response.status).to eq status.to_i
end

Then /^the JSON response body should have the following elements:$/ do |elements|
  elements.raw.flatten.map {|element| expect(last_response.body).to include('"'+ element + '":') }
end

Then /^the JSON response body should return "([^\"]*)" for "([^\"]*)"$/ do |value, element|
  parsed_response = JSON.parse(last_response.body)
  expect(parsed_response["user"][element]).to == value
end

Then /^the JSON response body should have the following rel and href values:$/ do |table|
  table.map_headers! {|header| header.to_sym }
  link_collection = JSON.parse(last_response.body)["links"]
  table.hashes.each do |row|
    selected = link_collection.find { |l| l['rel'] == row[:rel] }
    expect(selected['href']).to eq row[:href]
  end
end

Then /^the JSON response should contain the following links:$/ do |elements|
  elements.raw.flatten.map {|element| expect(JSON.parse(last_response.body)["links"][element]).to eq value }
end

Then /^the JSON response should be an array with (\d+) "([^\"]*)" elements$/ do |number_of_children, name|
  parsed_response = JSON.parse(last_response.body)
  expect(parsed_response.map { |d| d[name] }.length).to eq number_of_children.to_i
end

Then /^the JSON response should return "(.*?)" for "(.*?)"$/ do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end
