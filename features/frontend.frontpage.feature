# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

@ui_only
Feature: Checks the frontpage ui on the frontend

  Background:
    Given I am on the fundraising frontpage

  @ui_only
  Scenario Outline: Checks if the account details shows and hides
    When I select the <donation_option> option
    And I select the 5 euro option
    And I click on the continue button
    Then The IBAN details form <account_details_visibility>

  Examples:
    | donation_option | account_details_visibility |
    | deposit donation | hides                     |
    | credit donation | hides                      |
    | debit donation | shows                       |
    | paypal donation | hides                      |

  @ui_only
  Scenario: Checks if form stays the same when continuing
    When I click on the continue button
    Then The payment data form shows

  @ui_only
  Scenario Outline: Checks if the regularly bar shows and hides
    When I select the <interval> option
    Then The regularly option bar <visibility>

  Examples:
    | interval | visibility |
    | regularly donation | shows |
    | single donation | hides |

  @ui_only
  Scenario Outline: Checks if the IBAN details shows and hides
    Given I select the debit donation option
    And I select the 5 euro option
    And I click on the continue button
    When I select the <account_option> option
    Then The IBAN details form <iban_visibility>
    And The NONIBAN details form <noniban_visibility>

  Examples:
    | account_option | iban_visibility | noniban_visibility |
    | iban | shows | hides |
    | noiban | hides | shows |

  @ui_only
  Scenario Outline: Checks if the business data shows and hides
    Given I select the debit donation option
    And I select the 5 euro option
    And I click on the continue button
    When I select the <donator_option> option
    Then The company field <company_visibility>
    And The first_name field <first_name_visibility>

  Examples:
    | donator_option | company_visibility | first_name_visibility |
    | business donation | shows | hides |
    | private donation | hides | shows |

  @ui_only
  Scenario: Checks if the anonymous option hides on debit
    When I select the debit donation option
    And I select the 5 euro option
    And I click on the continue button
    Then The anonymous option hides

  @ui_only
  Scenario Outline: Checks if the selectable amount displayed is correct
    When I select the <option> option
    And I select the debit donation option
    And I click on the continue button
    Then The amount display should show <value> Euro

  Examples:
    | option | value |
    #| 5 euro | 5,00 |
    | 15 euro | 15,00 |
    #| 25 euro | 25,00 |
    #| 50 euro | 50,00 |
    #| 75 euro | 75,00 |
    #| 100 euro | 100,00 |
    | 250 euro | 250,00 |

  @ui_only
  Scenario: Checks if the amount displayed is correct
    And I enter a valid random amount in the amount field
    And I select the deposit donation option
    And I click on the continue button
    Then The amount display should show the given amount
