# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Check the info checkbox on the frontend

  Background:
    Given I am on the fundraising frontpage
    And I select the deposit donation option
    And I click on the continue button
    And I wait a second
    When I select the private donation option
    And I enter random valid private address data
    And I wait a second

  Scenario: Checks if the newsletter info is saved
    When I select the send information option
    And I click on the done button
    Then The donation sheet shows
    And The send information text shows