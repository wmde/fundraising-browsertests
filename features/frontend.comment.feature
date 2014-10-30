# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Check the comment function on the frontend

  Background:
    Given I finished a private debit donation with iban

  Scenario: Checks the comment can be submitted
    Given I click on the add comment link
    And I enter a harmless comment text
    And I click the submit comment button
    Then a positive feedback should show