# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Check the cancel function on the frontend

  Background:
    Given I finished a private debit donation with iban

  Scenario: Checks the donation can be canceled
    When I click on the cancel donation button
    Then The donation canceled page shows