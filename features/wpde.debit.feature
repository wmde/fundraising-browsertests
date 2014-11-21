# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Check the debit process on the wikipedia.de banner lightbox

  Background:
    Given I am on the wikipedia.de frontpage
    And The wikipedia.de lightbox banner shows
    And I change the lightbox to testmode


  Scenario Outline: Checks if debit donation transfers the transfers the right amount
    When I click the banner <option> amount option
    And I click on the debit button
    And The donation lightbox shows
    And The address details form shows
    And I select the noiban option
    And The account details form shows
    And I enter valid account data
    And I enter random valid private address data
    And I wait a second
    And I click on the done button
    And I switch to the new window
    Then The debit confirmation form shows
    And The debit donation amount should show <value> Euro

  Examples:
    | option | value |
    | amount5 | 5,00 |
    #| amount15 | 15,00 |
    #| amount25 | 25,00 |
    #| amount50 | 50,00 |
    #| amount75 | 75,00 |
    #| amount100 | 100,00 |
    | amount250 | 250,00 |

  @no_iban
  Scenario Outline: Checks the debit donation without IBAN
    Given I click on the debit button
    And The donation lightbox shows
    And The address details form shows
    When I select the noiban option
    And The account details form shows
    And I enter valid account data
    And I select the <address_type> donation option
    And I wait a second
    And I enter random valid <address_type> address data
    And I click on the done button
    And I switch to the new window
    Then The debit confirmation form shows
    And The <address_type> data on the receipt page should be the same

  Examples:
    | address_type |
    | private |
    | business |


  Scenario Outline: Checks the debit donation with german IBAN
    Given I click on the debit button
    And The donation lightbox shows
    And The address details form shows
    When I select the iban option
    And I enter a valid german iban
    And I select the <address_type> donation option
    And I wait a second
    And I enter random valid <address_type> address data
    And I click on the done button
    And I switch to the new window
    Then The debit confirmation form shows
    And The <address_type> data on the receipt page should be the same

  Examples:
    | address_type |
    | private |
    | business |

  Scenario: Checks the debit donation with non german IBAN
    Given I click on the debit button
    And The donation lightbox shows
    When I select the iban option
    And I enter a valid iban and bic
    And I enter random valid private address data
    And I click on the done button
    And I switch to the new window
    Then The debit confirmation form shows
    And The private data on the receipt page should be the same

  Scenario: Checks the debit donation approval
    Given I click on the debit button
    And The donation lightbox shows
    And The address details form shows
    And I select the iban option
    And I enter a valid german iban
    And I enter random valid private address data
    And I click on the done button
    And I switch to the new window
    And The debit confirmation form shows
    When I confirm the debit contract
    And I confirm the notification contract
    And I click on the done button
    Then The debit receipt shows