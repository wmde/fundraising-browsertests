# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de> <christoph.fischer@wikimedia.de>

Feature: Check the functions of the membership from

  Background:


  Scenario Outline: Checks if valid address data is transmitted to the member form
    Given I am on the fundraising frontpage
    And I select the deposit donation option
    And I click on the continue button
    And I wait a second
    When I select the <address_type> donation option
    And I enter random valid <address_type> address data
    And I click on the done button
    Then The deposit donation confirmation shows
    And I click on the become member link
    Then The address details form shows
    And The <address_type> membership address data should be the same
    And The lower fee rates should be <lower_fee>

  Examples:
    | address_type | lower_fee |
    | private | available |
    | business | unavailable |

  Scenario Outline: Checks the debit donation with different membership fees
    Given I finished a private debit donation with iban
    And I click on the become member link
    And The address details form shows
    And I select the <fee_option> option
    When I click on the done member button
    And The debit confirmation form shows
    And I confirm the debit contract
    And I click on the done button
    Then The membership confirmation shows
    And The private data on the receipt page should be the same

  Examples:
    | fee_option |
#    | 24 euro fee |
#    | 50 euro fee |
    | 75 euro fee |
#    | 100 euro fee |
#    | 150 euro fee |

