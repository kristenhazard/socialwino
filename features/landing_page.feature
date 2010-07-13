Feature: Landing Page
  In order to understand what socialwino is all about
  As a new user
  I want to see a description of the site
  
  Scenario: New user lands on landing page
    Given I am on the home page
    Then I should see "Welcome!"