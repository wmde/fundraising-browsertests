
Feature: Check the address validation on the frontend

  Background:
    Given I am on the fundraising frontpage
    And I click on the continue button
    And I wait a second

  Scenario Outline: Checks if sufficient address data is given
    When I select the <donation_type> option
    And I select the <address_type> option
    And I enter random valid address data
    And I erase the city data field
    And I click on the done button
    Then Address from should be visible

    Examples:
    | donation_type | address_type |
    | deposit donation | private donation |
    | credit donation | private donation |
    | paypal donation | private donation |
    | deposit donation | business donation |
    | credit donation | business donation |
    | paypal donation | business donation |

  Scenario Outline: Checks if invalid address data stops the process
    When I select the <donation_type> option
    And I select the <address_type> option
    And I enter random valid address data
    And I enter an invalid postcode
    And I click on the done button
    Then Address from should be visible

    Examples:
    | donation_type | address_type |
    | deposit donation | private donation |
    | credit donation | private donation |
    | paypal donation | private donation |
    | deposit donation | business donation |
    | credit donation | business donation |
    | paypal donation | business donation |
