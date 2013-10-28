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
    Given I send a POST request to "/user_admin_api/organizations/1/newsletters?title=newsletter_title&subtitle=newsletter_subtitle" with a valid title and subtitle
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
    Given I send a POST request to "/user_admin_api/organizations/1/newsletters?title=newsletter_title&subtitle=newsletter_subtitle" with a valid title and subtitle
    And I send a GET request to "/user_admin_api/organizations/1/newsletters"
    Then the JSON response headers should set appropriately
    Then the response code should be "200"
    And the JSON response body should have the following elements:
      | title    | 
      | subtitle |
    And the JSON response body should have the following rel and href values:
      | rel    | href           |
      | self   | /newsletters/1 |

     


    
   

 