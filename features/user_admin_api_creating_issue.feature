@newsletters
Feature: Creating Issues of a Newsletter 
  As a user of the User Adimin API
  In order to spread info and news among members of my organization
  I want to create issues of my organization's newsletter
  
  Background:
    Given I am a valid user of the User Admin API
    And I send and accept JSON
    And I haven't created a newsletter
  
  Scenario: Creating a newsletter
    Given I send a POST request to "/user_admin_api/v1/organization/:id/newsletter" with a valid title
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response should be an array containing the newsletter's title

  Scenario: Creating an issue (draft) of the newsletter
    Given I send a POST request to "/user_admin_api/v1/newsletter/:id/issues" with valid attributes
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response should be an array containing the issue's attributes
   
  Scenario: Retrieving a specific release
    Given I send a GET request to "/user_admin_api/v1/issues/:id/articles/1"
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response body should have the following elements:
      | title               | 
      | artist              |
      | formats             |
      | price               |
      | published_datetime  | 
      | expired_datetime    |
    And the JSON response body should have the following rel and href values:
      | rel    | href             |
      | self   | /user_admin_api/v1/issues/:id/articles/1 |
      | articles  | /user_admin_api/v1/issues/:id/articles/   |
      | issue  | /user_admin_api/v1/issues/:id/   |
