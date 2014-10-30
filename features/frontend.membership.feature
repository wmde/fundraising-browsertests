# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de> <christoph.fischer@wikimedia.de>

Feature: Check the functions of the membership from

  Background:
    Given I am on the fundraising frontpage
    And I select the deposit donation option
    And I click on the continue button
    And I wait a second

  Scenario Outline: Checks if valid address data is transmitted to the member form
    When I select the <address_type> donation option
    And I enter random valid <address_type> address data
    And I click on the done button
    Then The donation sheet shows
    And I click on the become member link
    Then The address details form shows
    And The <address_type> membership address data should be the same
    And The lower fee rates should be <lower_fee>

  Examples:
    | address_type | lower_fee |
    | private | available |
    | business | unavailable |

