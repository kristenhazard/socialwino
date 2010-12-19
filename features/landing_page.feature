Feature: Landing Page
  In order to understand what socialwino is all about
  As a new user
  I want to see a description of the site
  
  Scenario: New user lands on landing page
    Given I am on the home page
    Then I should see "sign up here"
    
  Scenario: New wino goes to sign up page and enters an email
    Given I am on the home page
    When I follow "sign up here"
    Then I should be on the sign up page
    When I fill in "prelaunch_signup_email" with "socialwino@gmail.com"
    And I press "prelaunch_signup_submit"
    Then I should see "Awesome"
    
  Scenario: New winemaker goes to sign up page and enters an email
    Given I am on the home page
    When I follow "sign up here"
    Then I should be on the sign up page
    When I fill in "prelaunch_signup_email" with "socialwino@winery.com"
    And I press "prelaunch_signup_submit"
    Then I should see "Awesome"
    
  Scenario: Invalid email
    Given I am on the home page
    When I follow "sign up here"
    Then I should be on the sign up page
    When I fill in "prelaunch_signup_email" with "kristen hazard"
    And I press "prelaunch_signup_submit"
    Then I should see "Email is invalid"