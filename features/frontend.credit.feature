# @licence GNU GPL v2+
# @author Christoph Fischer

Feature: Check the credit process on the frontend

  Background:
    Given I am on the fundraising frontpage
    And I select the credit donation option
    And I click on the continue button
    And I wait a second


  Scenario: Check the anonymous credit card donation
    When I select the anonymous donation option
    And I wait a second
    And I click on the done button
    And I wait a second
    Then The credit card form shows


  Scenario: Check the non anonymous credit card donation
    When I select the private donation option
    And I enter random valid private address data
    And I wait a second
    And I click on the done button
    And I wait a second
    Then The credit card form shows
    And The cardholder should be the surname and name


  Scenario: Check the non anonymous credit card donation
    When I select the business donation option
    And I enter random valid business address data
    And I wait a second
    And I click on the done button
    And I wait a second
    Then The credit card form shows
