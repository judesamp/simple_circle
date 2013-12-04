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
        | issue_number  |
      And the JSON response body should have the following rel and href values:
        | rel    | href      |
        | self   | /issues/1 |

    Scenario: Retrieving all issues
      Given I have already signed up my organization and created a newsletter
      Given I send a POST request to "/user_admin_api/newsletters/1/issues"
      And I send another POST request to "/user_admin_api/newsletters/1/issues"
      Given I send a GET request to "/user_admin_api/newsletters/1/issues"
      Then the JSON response headers should set appropriately
      Then the response code should be "200"
      And the JSON response body should be an array with a length of "2"
     
    Scenario: Updating or editing a specific issue of a newsletter
      Given I have already signed up my organization and created a newsletter
      Given I send a POST request to "/user_admin_api/newsletters/1/issues" with the body
      """
        {
          "draft_name": "my_draft"
        }
      """

      When I send a PUT request to "/user_admin_api/issues/1" with the body
      """
        {
          "draft_name": "new_draft_name"
        }
      """
      Then the JSON response headers should set appropriately
      Then the response code should be "200"
      Then the the JSON response body should not have the key/value pair, "draft_name" and "my_draft"
      Then the the JSON response body should have the key/value pair, "draft_name" and "new_draft_name"
      
    Scenario: Deleting a specific issue of a newsletter
      Given I have already signed up my organization and created a newsletter
      Given I send a POST request to "/user_admin_api/newsletters/1/issues?draft_name=my_draft"
      When I send a DELETE request to "/user_admin_api/issues/1"
      Then the JSON response headers should set appropriately
      Then the response code should be "200"


