Feature: Person
 In order to create a person
 As a user
 I want to create a person
 So that I can demonstrate the a fucnational API.
 
  Scenario: Create a valid person
    Given I send and accept JSON
    When I send a POST request to "/api/persons" with the following:
    """
    {"person":{"name":"Bob"}}
    """
    Then the response status should be "201"
    And I should have the following people:
    | name |
    | Bob  |

  Scenario: Create an invalid person
    Given I send and accept JSON
    When I send a POST request to "/api/persons" with the following:
    """
    {"person":{"name":""}}
    """
    Then the response status should be "422"
    And I should have no people.
  