# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

@banner_campaign
Feature: Check the paypal process on the wikipedia.de banner lightbox

  Background:
    Given I am on the wikipedia.de frontpage
    And The wikipedia.de lightbox banner shows
    And I change the lightbox to testmode

  @paypal
  Scenario Outline: Checks if the chosen value is displayed correctly
    When I click the banner <option> amount option
    And I click on the paypal button
    And The donation lightbox shows
    And The address details form shows
    And I select the anonymous donation option
    And I wait a second
    And I click on the done button
    And I switch to the new window
    Then The paypal form shows
    And The paypal donation amount should show <value> Euro

  Examples:
    | option | value |
    #| amount5 | 5,00 |
    | amount15 | 15,00 |
    #| amount25 | 25,00 |
    #| amount50 | 50,00 |
    #| amount75 | 75,00 |
    | amount100 | 100,00 |
    #| amount250 | 250,00 |

  @paypal
  Scenario Outline: Check the non anonymous paypal donation
    Given I click on the paypal button
    And The donation lightbox shows
    And The address details form shows
    When I select the <address_type> donation option
    And I enter random valid <address_type> address data
    And I wait a second
    And I click on the done button
    And I switch to the new window
    And I wait a second
    And I login with my paypal credentials
    And I click on the paypal continue button
    And I click on the paypal back button
    Then The normal donation confirmation shows
    And The <address_type> data on the receipt page should be the same

  Examples:
    | address_type |
    | private |
    #| business |


