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
    Given I send a POST request to "/user_admin_api/organizations?name=myorgname&email=myorgemail@orgname.com" with a valid organization name and email
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response body should have the following elements:
      | name  |
      | email |
   
  Scenario: Retrieving a specific organization
    Given I send a POST request to "/user_admin_api/organizations?name=myorgname&email=myorgemail@orgname.com" with a valid organization name and email
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
      | self   | /user_admin_api/organizations/1   |
   
