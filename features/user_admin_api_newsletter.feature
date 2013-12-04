@newsletters
Feature: Creating a Newsletter 
  As a user of the User Admin API
  In order to spread info and news among members of my organization
  I want to create a newsletter
  
  Background:
    Given I have already signed up my organization
    And I am a valid user of the User Admin API
    And I send and accept JSON
    And I haven't created a newsletter
  
  Scenario: Creating a newsletter
    Given I send a POST request to "/user_admin_api/organizations/1/newsletters" with the body
    """
        {
          "title" : "newsletter_title",
          "subtitle" : "newsletter_subtitle"
        }
    """
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    Then the JSON response body should have the following elements:
      | title            |
      | subtitle         |
      | organization_id  |
    Then the JSON response body should return the following values: 
      | newsletter_title    |
      | newsletter_subtitle |

  Scenario: Retrieving a specific newsletter
    Given I send a POST request to "/user_admin_api/organizations/1/newsletters" with the body
    """
        {
          "title" : "newsletter_title",
          "subtitle" : "newsletter_subtitle"
        }
    """
    And I send a GET request to "/user_admin_api/newsletters/1"
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response body should have the following elements:
      | title    | 
      | subtitle |
    And the JSON response body should have the following rel and href values:
      | rel    | href           |
      | self   | /newsletters/1 |

  Scenario: Updating or editing a specific newsletter
    Given I send a POST request to "/user_admin_api/organizations/1/newsletters" with the body
    """
        {
          "title" : "newsletter_title",
          "subtitle" : "newsletter_subtitle"
        }
    """
    When I send a PUT request to "/user_admin_api/newsletters/1" to update my issue with the body
    """
        {
          "title" : "new_newsletter_title"
        }
    """
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    Then the the JSON response body should not have the key/value pair, "title" and "newsletter_title"
    Then the the JSON response body should have the key/value pair, "title" and "new_newsletter_title"


    
   

 