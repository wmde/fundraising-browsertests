
Feature: Check the donation process on the frontend

  Background:
    Given I am on the fundraising frontpage

  Scenario: Checks if the address form shows when continuing
    When I click on the continue button
    Then The address details form shows


  Scenario Outline: Checks if the regularly bar shows and hides
    When I select the <interval> option
    Then The regularly option bar <visibility>

  Examples:
     | interval | visibility |
     | regularly donation | shows |
     | single donation | hides |


  Scenario Outline: Checks if the account details shows and hides
    When I select the <donation_option> option
    And I click on the continue button
    And I wait a second
    Then The account details form <account_details_visibility>


  Examples:
    | donation_option | account_details_visibility |
    | deposit donation | hides
    | credit donation | hides
    | debit donation | shows
    | paypal donation | hides


  Scenario Outline: Checks if the IBAN details shows and hides
    Given I select the debit donation option
    And I click on the continue button
    When I select the <account_option> option
    And I wait a second
    Then The IBAN details form <iban_visibility>
    And The NONIBAN details form <noniban_visibility>

  Examples:
    | account_option | iban_visibility | noniban_visibility |
    | iban | shows | hides |
    | noiban | hides | shows |


  Scenario Outline: Checks if the business data show
    Given I select the debit donation option
    And I click on the continue button
    When I select the <donator_option> option
    And I wait a second
    Then The company field <company_visibility>
    And The first_name field <first_name_visibility>

  Examples:
    | donator_option | company_visibility | first_name_visibility |
    | business donation | shows | hides |
    | private donation | hides | shows |


  Scenario: Checks if the anonymous option hides on debit
    When I select the debit donation option
    And I click on the continue button
    And I wait a second
    Then The anonymous option hides


  Scenario Outline: Checks if the amount displayed is correct
    Given I click on the continue button
    When I select the <option> option
    Then The amount display should show <value> Euro

  Examples:
    | option | value |
    | 5 euro | 5 |
    #| 15 euro | 15 |
    #| 25 euro | 25,00 |
    #| 50 euro | 50,00 |
    #| 75 euro | 75,00 |
    #| 100 euro | 100,00 |
    #| 250 euro | 250,00 |


  Scenario: Checks if the amount displayed is correct
    Given I click on the continue button
    When I enter a random amount in the amount field
    Then The amount display should show the given amount
