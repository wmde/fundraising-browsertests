# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

@ui_only
Feature: Checks the ui on the wikipedia.de banner lightbox

  Background:
    Given I am on the wikipedia.de frontpage
    And The wikipedia.de lightbox banner shows
    And I change the lightbox to testmode

  @ui_only
  Scenario: Checks if the lightbox shows when continuing
    When I click on the debit button
    Then The donation lightbox shows

  @ui_only
  Scenario: Checks if the address form shows when continuing
    When I click on the debit button
    Then The address details form shows

#  @ui_only
#  Scenario Outline: Checks if the regularly bar shows and hides
#    When I select the <interval> option
#    Then The regularly option bar <visibility>

#  Examples:
#     | interval | visibility |
#     | regularly donation | shows |
#     | single donation | hides |

#  @ui_only
#  Scenario Outline: Checks if the account details shows and hides
#    When I select the <donation_option> option
#    And I click on the continue button
#    Then The IBAN details form <account_details_visibility>


#  Examples:
#    | donation_option | account_details_visibility |
#    | deposit donation | hides                     |
#    | credit donation | hides                      |
#    | debit donation | shows                       |
#    | paypal donation | hides                      |

  @ui_only
  Scenario Outline: Checks if the IBAN details shows and hides
    When I click on the debit button
    And The donation lightbox shows
    And I select the <account_option> option
    Then The IBAN details form <iban_visibility>
    And The NONIBAN details form <noniban_visibility>

  Examples:
    | account_option | iban_visibility | noniban_visibility |
    | iban | shows | hides |
    | noiban | hides | shows |

  @ui_only
  Scenario Outline: Checks if the business data shows and hides
    When I click on the debit button
    And The donation lightbox shows
    And I select the <donator_option> option
    Then The company field <company_visibility>
    And The first_name field <first_name_visibility>

  Examples:
    | donator_option | company_visibility | first_name_visibility |
    | business donation | shows | hides |
    | private donation | hides | shows |

  @ui_only
  Scenario: Checks if the anonymous option hides on debit
    When I click on the debit button
    And The donation lightbox shows
    Then The anonymous option hides

  @ui_only
  Scenario Outline: Checks if the selectable amount displayed is correct
    When I click the banner <option> amount option
    And I click on the debit button
    And The donation lightbox shows
    Then The amount display should show <value> Euro

  Examples:
    | option | value |
    | amount5 | 5,00 |
    | amount15 | 15,00 |
    | amount25 | 25,00 |
    | amount50 | 50,00 |
    | amount75 | 75,00 |
    | amount100 | 100,00 |
    | amount250 | 250,00 |