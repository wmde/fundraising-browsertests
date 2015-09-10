# @licence GNU GPL v2+
# @author Leszek Manicki <leszek.manicki@wikimedia.de>

Feature: Check the functions of the contact form

  Background:
    Given I am on the contact form page

  Scenario: Checks if entering all data and clicking submit button sends the message
    Given I enter valid random contact form data
    And I click the contact form submit button
    Then The contact message confirmation page shows
    And contains contact form acknowledgement message

  Scenario Outline: Checks if relevant error message is shown when insufficient data is entered
    Given I enter valid random contact form data
    And I erase contents of the <field> field from the contact form
    And I click the contact form submit button
    Then The error message shows
    And The error message is about the contact form missing value of <field>

    Examples:
      | field |
      | last name  |
      | email      |
      | subject    |
      | message |