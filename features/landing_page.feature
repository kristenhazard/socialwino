Feature: Landing Page
  In order to understand what socialwino is all about
  As a new user
  I want to see a description of the site
  
  Scenario: New user lands on landing page
    Given I am on the home page
    Then I should see "Join Us"
    #And I should see a text field to enter my email
    
  Scenario: New user enters signs up with valid email
    Given I am on the home page
    When I fill in "prelaunch_signup_email" with "socialwino@gmail.com"
    And I press "prelaunch_signup_submit"
    Then I should see "Awesome"
    
  Scenario: Invalid email
    Given I am on the home page
    When I fill in "prelaunch_signup_email" with "kristen hazard"
    And I press "prelaunch_signup_submit"
    Then I should see "Email is invalid"