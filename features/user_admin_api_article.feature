@articles
Feature: Creating an article
  As a user of the User Admin API
  In order to spread info and news among members of my organization
  I want to create an issue of my newsletter
  And I want to add articles to my newsletter
  
  Background:
    Given I have already signed up my organization and created a newsletter
    And I have already created an issue by sending a POST request to "/user_admin_api/newsletters/1/issues"
    And I am a valid user of the User Admin API
    And I send and accept JSON
  
    Scenario: Creating and adding an article to an issue (of the org's newsletter)
      Given I send a POST request to "/user_admin_api/issues/1/articles" with the body
      """
        {
          "title" : "my_title"
        }
      """
      Then the JSON response headers should set appropriately
      Then the response code should be "200"
      Then the JSON response body should have the following elements:
        | issue_id      |
        | title         |
        | summary       |
        | tags          |
        | article_text  |
        | author        |
        | img_url       |

    Scenario: Retrieving an article
      Given I send a POST request to "/user_admin_api/issues/1/articles" with the body
      """
        {
          "title" : "my_title"
        }
      """
      When I send a GET request to "/user_admin_api/articles/1"
      Then the JSON response headers should set appropriately
      Then the response code should be "200"
      And the JSON response body should have the following elements:
        | issue_id      |
        | title         |
        | summary       |
        | tags          |
        | article_text  |
        | author        |
        | img_url       |
      And the JSON response body should have the following rel and href values:
        | rel    | href         |
        | self   | /articles/1  |

    Scenario: Retrieving all articles
      Given I send a POST request to "/user_admin_api/issues/1/articles" with the body
      """
        {
          "title" : "my_title"
        }
      """
      Given I send another POST request to "/user_admin_api/issues/1/articles" with the body
      """
        {
          "title" : "another_title"
        }
      """
      When I send a GET request to "/user_admin_api/issues/1/articles"
      Then the JSON response headers should set appropriately
      Then the response code should be "200"
      And the JSON response body should be an array with a length of "2"

    Scenario: Updating or editing a specific article
      Given I send a POST request to "/user_admin_api/issues/1/articles" with the body
      """
        {
          "title" : "my_title"
        }
      """
      When I send a PUT request to "/user_admin_api/articles/1" with the body
      """
        {
          "title" : "my_new_title"
        }
      """
      Then the JSON response headers should set appropriately
      Then the response code should be "200"
      Then the the JSON response body should not have the key/value pair, "title" and "my_title"
      Then the the JSON response body should have the key/value pair, "title" and "my_new_title"

    Scenario: Deleting a specific article
      Given I have already signed up my organization and created a newsletter
      And I have already created an issue by sending a POST request to "/user_admin_api/newsletters/1/issues"
      Given I send a POST request to "/user_admin_api/issues/1/articles" with the body
      """
        {
          "title" : "my_title"
        }
      """
      When I send a DELETE request to "/user_admin_api/articles/1"
      Then the JSON response headers should set appropriately
      Then the response code should be "200"

