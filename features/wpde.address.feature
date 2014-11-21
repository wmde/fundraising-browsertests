# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Check the address validation on the wikipedia.de banner lightbox

  Background:
    Given I am on the wikipedia.de frontpage
    And The wikipedia.de lightbox banner shows
    And I click on the deposit button
    And The donation lightbox shows
    And The address details form shows

  Scenario Outline: Checks if insufficient address data stops the process
    And I select the private donation option
    And I enter random valid private address data
    And I erase the <field> data field
    And I click on the done button
    Then Address from should be visible

    Examples:
      | field |
      | city |
      | first name |
      | street |
      | email |
      | postcode |

  Scenario Outline: Checks if invalid address data stops the process
    And I select the private donation option
    And I enter random valid private address data
    And I enter an invalid <field>
    And I click on the done button
    Then Address from should be visible

    Examples:
      | field |
      | email |
      | postcode |
