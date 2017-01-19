# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Check the paypal process on the frontend

  Background:
    Given I am on the fundraising frontpage
    And I select the paypal donation option


  Scenario Outline: Checks if the chosen value is displayed correctly
    When I select the <option> option
    And I click on the continue button
    And The address details form shows
    And I select the anonymous donation option
    And I wait a second
    And I click on the done button
    Then The paypal form shows
    And The paypal donation amount should show <value> Euro

  Examples:
    | option | value |
    #| 5 euro | 5,00 |
    | 15 euro | 15,00 |
    #| 25 euro | 25,00 |
    #| 50 euro | 50,00 |
    #| 75 euro | 75,00 |
    #| 100 euro | 100,00 |
    #| 250 euro | 250,00 |

  @only_online
  Scenario Outline: Check the non anonymous paypal donation
    Given I select the 15 euro option
    And I click on the continue button
    And The address details form shows
    When I select the <address_type> donation option
    And I enter random valid <address_type> address data
    And I click on the done button
    And I login with my paypal credentials
    And I click on the paypal continue button
    And I click on the paypal back button
    Then The normal donation confirmation shows
    And The <address_type> data on the receipt page should be the same

  Examples:
    | address_type |
    | private |
    #| business |
