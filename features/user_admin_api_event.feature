@events
Feature: Creating an event
  As a user of the User Admin API
  In order to spread info and news among members of my organization
  I want to create an issue of my newsletter
  And I want to add events to my newsletter
  
  Background:
    Given I have already signed up my organization and created a newsletter
    And I have already created an issue by sending a POST request to "/user_admin_api/newsletters/1/issues"
    And I am a valid user of the User Admin API
    And I send and accept JSON
  
    Scenario: Creating and adding an article to an issue (of the org's newsletter)
      Given I send a POST request to "/user_admin_api/issues/1/events?event_name=my_event_name"
      Then the JSON response headers should set appropriately
      Then the response code should be "200"
      Then the JSON response body should have the following elements:
        | issue_id          |
        | event_name        |
        | description       |
        | contact           |
        | contact_email     |
        | contact_phone     |
        | event_start_date  |
        | event_end_date    |
        | expire_on         |

    Scenario: Retrieving an article
      Given I have already created an article by sending a POST request to "/user_admin_api/issues/1/events?event_name=my_event_name"
      Given I send a GET request to "/user_admin_api/events/1"
      Then the JSON response headers should set appropriately
      Then the response code should be "200"
      And the JSON response body should have the following elements:
        | issue_id          |
        | event_name        |
        | description       |
        | contact           |
        | contact_email     |
        | contact_phone     |
        | event_start_date  |
        | event_end_date    |
        | expire_on         |
      And the JSON response body should have the following rel and href values:
        | rel    | href       |
        | self   | /events/1  |

    Scenario: Retrieving all events

    Scenario: Updating or editing a specific event

    Scenario: Deleting a specific event