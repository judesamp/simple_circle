@organizations
Feature: Signing up as or Creating an Organization 
  As a user of the User Adimin API
  In order to spread info and news among members of my organization
  I want to sign up as an organization
  
  Background:
    Given I am a valid user of the User Admin API
    And I send and accept JSON
    And I haven't created an organization
  
  Scenario: Signing up as (or creating) an organization
    Given I send a POST request to "/user_admin_api/organizations" with a valid organization name and email
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response body should have the following elements:
      | name  |
      | email |
    And the the JSON response body should have the key/value pair, "status" and "active"
   
  Scenario: Retrieving a specific organization
    Given I send a POST request to "/user_admin_api/organizations" with a valid organization name and email
    And I send a GET request to "/user_admin_api/organizations/1"
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response body should have the following elements:
      | name           | 
      | street_address |
      | city           |
      | state          |
      | zip            |
      | email          |
    And the JSON response body should have the following rel and href values:
      | rel    | href                              |
      | self   | /organizations/1   |
   
  Scenario: Deleting a specific organization
    Given I have already signed up my organization
    When I send a DELETE request to "/user_admin_api/organizations/1"
    Then the JSON response headers should set appropriately
    Then the response code should be "200"

  Scenario: Updating or editing a specific organization
    Given I send a POST request to "/user_admin_api/organizations" with a valid organization name and email
    When I send a PUT request to "/user_admin_api/organizations/1" with a body of "{'email': 'jeremy@example.com'}"
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    Then the the JSON response body should not have the key/value pair, "email" and "myorgemail@orgname.com"
    Then the the JSON response body should have the key/value pair, "email" and "jeremy@example.com"


    