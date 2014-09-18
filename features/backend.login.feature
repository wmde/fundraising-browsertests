# @licence GNU GPL v2+
# @author Christoph Fischer

Feature: Check the login to the fundraising backend

  Background:
    Given I am on the login page

  Scenario: Checks if you can login with valid credentials
    When User enters valid credentials
    And User clicks on login button
    Then Username-Link should be shown
    And Logout-Link should be shown