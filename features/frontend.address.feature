# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de> <christoph.fischer@wikimedia.de>

Feature: Check the address validation on the frontend

  Background:
    Given I am on the fundraising frontpage

  Scenario Outline: Checks if sufficient address data is given
    When I select the <donation_type> option
    And I click on the continue button
    And I wait a second
    And I select the <address_type> donation option
    And I enter random valid <address_type> address data
    And I erase the city data field
    And I click on the done button
    Then Address from should be visible

    Examples:
    | donation_type | address_type |
    | deposit donation | private |
    #| credit donation | private |
    #| paypal donation | private |
    #| deposit donation | business |
    #| credit donation | business |
    | paypal donation | business |


  Scenario Outline: Checks if invalid address data stops the process
    When I select the <donation_type> option
    And I click on the continue button
    And I wait a second
    And I select the <address_type> donation option
    And I enter random valid <address_type> address data
    And I enter an invalid postcode
    And I click on the done button
    Then Address from should be visible

    Examples:
    | donation_type | address_type |
    | deposit donation | private |
    #| credit donation | private |
    #| paypal donation | private |
    #| deposit donation | business |
    #| credit donation | business |
    | paypal donation | business |
