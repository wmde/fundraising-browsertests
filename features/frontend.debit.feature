
Feature: Check the debit process on the frontend

  Background:
    Given I am on the fundraising frontpage
    And I select the debit donation option
    And I click on the continue button
    And I wait a second

  Scenario Outline: Checks if the chosen value is displayed correctly
    When I select the noiban option
    And I wait a second
    And I enter valid account data
    And I select the <option> option
    And I enter random valid private address data
    And I click on the done button
    And I wait a second
    Then The debit form shows
    And The debit donation amount should show <value> Euro

  Examples:
    | option | value |
    #| 5 euro | 5,00 |
    | 15 euro | 15,00 |
    #| 25 euro | 25,00 |
    #| 50 euro | 50,00 |
    #| 75 euro | 75,00 |
    #| 100 euro | 100,00 |
    #| 250 euro | 250,00 |
