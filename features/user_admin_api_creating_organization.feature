@organizations
Feature: Creating an Organization 
  As a user of the User Adimin API
  In order to spread info and news among members of my organization
  I want to join Simply Circular (and create an organization)
  
  Background:
    Given I am a valid user of the User Admin API
    And I send and accept JSON
    And I haven't created an organization
  
  Scenario: Creating an organization
    Given I send a POST request to "/user_admin_api/v1/organizations/" with a valid organization name
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response should be an array containing the organizations name

    Scenario: Retrieving a specific release
    Given I send a GET request to "/user_admin_api/v1/organizations/:id"
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response body should have the following elements:
      | name             | 
    And the JSON response body should have the following rel and href values:
      | rel    | href             |
      | self   | /user_admin_api/v1/organizations/:id |
   