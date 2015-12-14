# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Check the confirm cookie function on the frontend

  Background:
    Given I visit Wikipedia
    And I reset the CentralNotice hide banner cookie
    And I finished a private debit donation with iban

  Scenario: Checks if the confirmation cookie was set
    When I visit Wikipedia
    Then The CentralNotice hide banner cookie should be set