# @licence GNU GPL v2+
# @author Christoph Fischer

Feature: Check the deposit process on the frontend

  Background:
    Given I am on the fundraising frontpage
    And I select the deposit donation option


  Scenario Outline: Checks if deposit donation transfers the right amount
    When I select the <option> option
    And I click on the continue button
    And I wait a second
    And I select the anonymous donation option
    And I wait a second
    And I click on the done button
    And I wait a second
    Then The donation sheet shows
    And The donation amount should show <value> Euro

  Examples:
    | option | value |
    #| 5 euro | 5,00 |
    | 15 euro | 15,00 |
    #| 25 euro | 25,00 |
    #| 50 euro | 50,00 |
    #| 75 euro | 75,00 |
    #| 100 euro | 100,00 |
    #| 250 euro | 250,00 |


  Scenario Outline: Checks if valid address data leads to a correct receipt
    Given I click on the continue button
    And I wait a second
    When I select the <address_type> donation option
    And I enter random valid <address_type> address data
    And I click on the done button
    And I wait a second
    And I click on the become member link
    And I wait a second
    Then The address details form shows
    And The <address_type> name on the become member from should be the same

  Examples:
  | address_type |
  | private |
  | business |