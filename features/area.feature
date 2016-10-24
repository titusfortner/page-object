Feature: Area

  Scenario: Retrieve an area element
    Given I am on the static elements page
    When I retrieve the area element
    Then I should know it exists
    And I should know it is visible
