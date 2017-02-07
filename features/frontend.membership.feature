# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Check the functions of the membership from

  Background:

  Scenario Outline: Checks if valid address data is transmitted to the member form
    Given I am on the fundraising frontpage
      And I select the 25 euro option
      And I select the deposit donation option
      And I click on the continue button
      And The address details form shows
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
      And I wait a second
      And I select the <fee_option> fee
    When I click on the continue member button
      And The debit confirmation form for membership shows
      And I confirm the debit contract
      And I click on the done member button
    Then The membership confirmation shows
      And The private data on the receipt page should be the same

  Examples:
    | fee_option |
#    | 25 euro |
#    | 50 euro |
    | 75 euro |
#    | 100 euro |
#    | 250 euro |

  Scenario: Checks if to low membership fees lead to an error
    Given I finished a business debit donation with iban
      And I click on the become member link
      And The address details form shows
      And I enter 10 euro in the amount field
    When I click on the continue member button
      Then Address form should be visible
