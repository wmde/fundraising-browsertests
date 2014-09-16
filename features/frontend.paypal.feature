
Feature: Check the paypal process on the frontend

  Background:
    Given I am on the fundraising frontpage
    And I select the paypal donation option
    And I click on the continue button
    And I wait a second

  Scenario: Check the anonymous paypal donation
    When I select the anonymous donation option
    And I wait a second
    And I click on the done button
    And I wait a second
    Then The paypal form shows

  Scenario Outline: Checks if the choosen value is displayed correctly
    When I select the anonymous donation option
    And I wait a second
    And I select the <option> option
    And I click on the done button
    And I wait a second
    Then The paypal form shows
    And The paypal donation amount should show <value> Euro

  Examples:
    | option | value |
    | 5 euro | 5,00 |
    | 15 euro | 15,00 |
    #| 25 euro | 25,00 |
    #| 50 euro | 50,00 |
    #| 75 euro | 75,00 |
    #| 100 euro | 100,00 |
    #| 250 euro | 250,00 |

  Scenario: Check the non anonymous credit card donation
    When I select the private donation option
    And I enter random valid private address data
    And I wait a second
    And I click on the done button
    And I wait a second
    Then The paypal form shows
    And The cardholder should be the surname and name




