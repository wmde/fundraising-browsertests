
Feature: Check the deposit process on the frontend

  Background:
    Given I am on the fundraising frontpage
    And I select the deposit donation option
    And I click on the continue button
    And I wait a second

  Scenario Outline: Checks if the chosen value is displayed correctly
    When I select the anonymous donation option
    And I wait a second
    And I select the <option> option
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

  Scenario: Checks if valid address data leads to a correct receipt
    When I select the private donation option
    And I enter random valid private address data
    And I click on the done button
    And I wait a second
    And I click on the become member link
    And I wait a second
    Then The address details form shows
    And The membership address data should be the same
