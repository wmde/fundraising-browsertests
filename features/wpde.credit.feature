# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

@banner_campaign
Feature: Check the credit process on the wikipedia.de banner lightbox

  Background:
    Given I am on the wikipedia.de frontpage
    And The wikipedia.de lightbox banner shows
    And I change the lightbox to testmode
    And I click on the credit button
    And The donation lightbox shows
    And The address details form shows


  Scenario: Check the anonymous credit card donation
    When I select the anonymous donation option
    And I wait a second
    And I click on the done button
    And I switch to the new window
    Then The credit card form shows


  Scenario: Check the non anonymous credit card donation
    When I select the private donation option
    And I enter random valid private address data
    And I wait a second
    And I click on the done button
    And I switch to the new window
    Then The credit card form shows
    And The cardholder should be the surname and name


  Scenario: Check the non anonymous credit card donation
    When I select the business donation option
    And I enter random valid business address data
    And I wait a second
    And I click on the done button
    And I switch to the new window
    Then The credit card form shows
