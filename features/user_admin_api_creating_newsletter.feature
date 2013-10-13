@newsletters
Feature: Creating a Newsletter 
  As a user of the User Adimin API
  In order to spread info and news among members of my organization
  I want to create a newsletter
  
  Background:
    Given I am a valid user of the User Admin API
    And I send and accept JSON
    And I haven't created a newsletter
  
  Scenario: Creating a newsletter
    Given I send a POST request to "/user_admin_api/v1/organizations/:id/newsletter" with a valid title
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response should be an array containing the newsletter's title

    Scenario: Retrieving a specific release
    Given I send a GET request to "/user_admin_api/v1/newsletters/:id"
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response body should have the following elements:
      | title               | 
      | subtitle            |
    And the JSON response body should have the following rel and href values:
      | rel    | href             |
      | self   | /user_admin_api/v1/newsletters/:id |
   