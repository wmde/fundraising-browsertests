# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Check the debit process on the frontend

  Background:
    Given I am on the fundraising frontpage
    And I select the debit donation option


  Scenario Outline: Checks if debit donation transfers the transfers the right amount
    When I select the <option> option
    And I click on the continue button
    And The address details form shows
    And I select the noiban option
    And The account details form shows
    And I enter valid account data
    And I enter random valid private address data
    And I wait a second
    And I click on the continue button
    Then The debit confirmation form shows
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

  @no_iban
  Scenario Outline: Checks the debit donation without IBAN
    Given I select the 5 euro option
    And I click on the continue button
    And The address details form shows
    When I select the noiban option
    And The account details form shows
    And I enter valid account data
    And I select the <address_type> donation option
    And I wait a second
    And I enter random valid <address_type> address data
    And I click on the continue button
    Then The debit confirmation form shows
    And The <address_type> data on the receipt page should be the same

  Examples:
    | address_type |
    | private |
    | business |


  Scenario Outline: Checks the debit donation with german IBAN
    Given I select the 5 euro option
    And I click on the continue button
    And The address details form shows
    When I select the iban option
    And I enter a valid german iban
    And I select the <address_type> donation option
    And I wait a second
    And I enter random valid <address_type> address data
    And I click on the continue button
    Then The debit confirmation form shows
    And The <address_type> data on the receipt page should be the same

  Examples:
    | address_type |
    | private |
    | business |

  Scenario: Checks the debit donation with non german IBAN
    Given I select the 5 euro option
    And I click on the continue button
    And The address details form shows
    When I select the iban option
    And I enter a valid iban and bic
    And I enter random valid private address data
    And I click on the continue button
    Then The debit confirmation form shows
    And The private data on the receipt page should be the same

  Scenario: Checks the debit donation approval
    Given I select the 5 euro option
    And I click on the continue button
    And The address details form shows
    And I select the iban option
    And I enter a valid german iban
    And I enter random valid private address data
    And I click on the continue button
    And The debit confirmation form shows
    When I confirm the debit contract
    And I confirm the notification contract
    And I click on the done button
    Then The debit receipt shows
