# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Check the functions of the stand alone membership from

  Background:
    Given I am on the stand alone membership formpage

  Scenario Outline: Checks the debit donation with different membership fees
    Given I select the 75 euro fee option
    And I enter a valid german iban
    And I select the private donation option
    And I enter random valid private address data
    And I select the <fee_option> option
    And I wait a second
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

  Scenario Outline: Checks if insufficient address data stops the process
    Given I select the 75 euro fee option
    And I enter a valid german iban
    And I select the private donation option
    And I enter random valid private address data
    And I erase the <field> data field
    And I click on the done member button
    Then Address from should be visible

  Examples:
    | field |
    | city |
    | first name |
    | street |
    | email |
    | postcode |

  Scenario Outline: Checks if invalid address data stops the process
    Given I select the 75 euro fee option
    And I enter a valid german iban
    And I select the private donation option
    And I enter random valid private address data
    And I enter an invalid <field>
    And I click on the done member button
    Then Address from should be visible

  Examples:
    | field |
    | email |
    | postcode |

  Scenario: Checks if to low membership fees lead to an error
    Given I enter a valid german iban
    And I select the business donation option
    And I enter random valid business address data
    And I enter 10 euro in the amount field
    And I wait a second
    When I click on the done member button
    Then The error box shows

  Scenario: Checks if the active membership is blocked for business
    Given I enter a valid german iban
    And I select the business donation option
    And I enter random valid business address data
    And I enter 10 euro in the amount field
    #And I select the active membership option
    When I click on the done member button
    Then Address from should be visible

  Scenario: Checks if the membership is transmitted correctly
    Given I enter a valid german iban
    And I select the private donation option
    And I enter random valid private address data
    And I select the 75 euro fee option
    #And I select the <membership_type> membership option
    And I wait a second
    When I click on the done member button
    Then The debit confirmation form shows
    #And The membership type should be <membership_type>

#    Examples:
#      | membership_type |
#      | sustaining |
#      | active |

