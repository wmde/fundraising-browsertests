# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Check the deposit process on the wikipedia.de banner lightbox

  Background:
    Given I am on the wikipedia.de frontpage
    And The wikipedia.de lightbox banner shows
    And I change the lightbox to testmode

  Scenario Outline: Checks if deposit donation transfers the right amount
    When I click the banner <option> amount option
    And I click on the deposit button
    And The donation lightbox shows
    And The address details form shows
    And I select the anonymous donation option
    And I wait a second
    And I click on the done button
    And I switch to the new window
    Then The deposit donation confirmation shows
    And The donation amount should show <value> Euro

  Examples:
    | option | value |
    | amount5 | 5,00 |
    #| amount15 | 15,00 |
    #| amount25 | 25,00 |
    #| amount50 | 50,00 |
    #| amount75 | 75,00 |
    #| amount100 | 100,00 |
    | amount250 | 250,00 |


  Scenario Outline: Checks if valid address data leads to a correct receipt
    When I click on the deposit button
    And The address details form shows
    When I select the <address_type> donation option
    And I enter random valid <address_type> address data
    And I click on the done button
    And I switch to the new window
    Then The deposit donation confirmation shows

  Examples:
    | address_type |
    | private |
    | business |