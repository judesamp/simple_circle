@posts
Feature: Creating an event
  As a user of the User Admin API
  In order to spread info and news among members of my organization
  I want to create an issue of my newsletter
  And I want to add posts (events and articles) to my newsletter
  
  Background:
    Given I have already signed up my organization and created a newsletter
    And I have already created an issue by sending a POST request to "/user_admin_api/newsletters/1/issues"
    And I am a valid user of the User Admin API
    And I send and accept JSON