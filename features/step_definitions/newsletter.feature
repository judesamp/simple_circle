Feature: Organzational Admin creates newsletter
  In order to keep organization members up to date
  As the person tasked with putting together and distributing infomration (user admin)
  I want to be able to create and distribute a newsletter
  
  Scenario: user admin wants to create an issue of a newsletter
    Given I have come to my organization admin url
    And I log in as user admin 
    When I click on the create newsletter button
    Then I should see a form that allows me to create a newsletter
    
  Scenario: organizational admin creates newsletter
    Given I am a user admin
    When I fill in the newsletter form
    And click on the submit button
    Then I should see a success message
    And I should see a preview of the newsletter
    And an invitation to create an article, announcement, or event
    




	