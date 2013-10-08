@newsletters
Feature: Creating, Editing, Previewing, and Publishing Issues of a Newsletter
  As a user of the User Adimin API
  In order to create, edit, preview, and publish issues of my organization's newsletter
  I want to create, edit, preview, and publish issues of my organization's newsletter
  
  Background:
    Given I am a valid user of the User Admin API
    And I send and accept JSON
    And you haven't created a newsletter
  
  Scenario: Creating a newsletter
    Given I send a POST request to "/user_admin_api/v1/organization/:id/newsletter" with a valid title
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response should be an array containing the newsletter's title and subtitle

  Scenario: Creating an issue (draft) of the newsletter
    Given I send a POST request to "/user_admin_api/v1/newsletter/:id/issue" with valid attributes
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response should be an array containing the issue's attributes

  Scenario: Adding an article to an issue (draft) of the newsletter
    Given I send a POST request to "/user_admin_api/v1/issue/:id/article" with valid attributes
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response should be an array containing the issue's attributes

  Scenario: Adding two articles to an issue (draft) of the newsletter
    Given I send two POST requests to "/user_admin_api/v1/issue/:id/article" with valid attributes
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response should be an array containing the issue's attributes

  Scenario: Adding an event to an issue (draft) of the newsletter
    Given I send a POST request to "/user_admin_api/issue/:id/event" with valid attributes
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response should be an array containing the issue's attributes

  Scenario: Adding two events to an issue (draft) of the newsletter
    Given I send two POST requests to "/user_admin_api/issue/:id/event" with valid attributes
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response should be an array containing the issue's attributes

  Scenario: Previewing an issue (draft) of the newsletter
    Given I send a POST request to "/user_admin_api/v1/newsletter/:id/preview" with valid attributes
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response should be an array containing the issue's attributes

  Scenario: Publishing an issue (draft) of the newsletter
    Given I send a POST request to "/user_admin_api/v1/newsletter/:id/publish" with valid attributes
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response should be an array containing the issue's attributes


















    Given I send a GET request to "/public_api/v1/releases"
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response should be an array with 5 "resource_uri" elements
    
  Scenario: Retrieving a specific release
    Given I send a GET request to "/public_api/v1/releases/1"
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
      | self   | /public_api/v1/releases/1 |
      | index  | /public_api/v1/releases   |