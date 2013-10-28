@issues
Feature: Creating an issue 
  As a user of the User Admin API
  In order to spread info and news among members of my organization
  I want to create an issue of my newsletter
  
  Background:
    Given I have already signed up my organization and created a newsletter
    And I am a valid user of the User Admin API
    And I send and accept JSON
  
  Scenario: Creating an issue of my newsletter
    Given I send a POST request to "/user_admin_api/newsletters/1/issues"
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    Then the JSON response body should have the following elements:
      | newsletter_id  |
      

  Scenario: Retrieving a specific issue of a specific newsletter
    Given I have already signed up my organization and created a newsletter
    Given I send a POST request to "/user_admin_api/newsletters/1/issues"
    Given I send a GET request to "/user_admin_api/issues/1"
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response body should have the following elements:
      | newsletter_id | 
      | issue_number  |
    And the JSON response body should have the following rel and href values:
      | rel    | href      |
      | self   | /issues/1 |