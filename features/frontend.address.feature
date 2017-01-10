# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

@ui_only
Feature: Check the address validation on the frontend

  Background:
    Given I am on the fundraising frontpage
    And I select the 5 euro option
    And I select the deposit donation option
    And I click on the continue button
    And The address details form shows

  @ui_only
  Scenario Outline: Checks if insufficient address data stops the process
    And I select the private donation option
    And I enter random valid private address data
    And I erase the <field> data field
    And I click on the done button
    Then Address form should be visible

    Examples:
      | field |
      | city |
      | first name |
      | street |
      | email |
      | postcode |

  @ui_only
  Scenario Outline: Checks if invalid address data stops the process
    And I select the private donation option
    And I enter random valid private address data
    And I enter an invalid <field>
    And I click on the done button
    Then Address form should be visible

    Examples:
      | field |
      | email |
      | postcode |
